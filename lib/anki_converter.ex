defmodule AnkiConverter do
  @moduledoc """
  Module which allows to convert between Anki, Mardown and HTML representations
  of learning flashcards.
  """

  require Logger

  @anki_separator ?\t
  @md_answer_separator "\n\n"
  @md_question_title "### Question\n"
  @md_question_title_regex ~r/### Question [0-9]+(\.[0-9]+)*\n/
  @md_answer_title "### Answer\n"

  def convert_from_anki_to_markdown_dir!(input_path, output_path) do
    input_path
    |> import_from_anki_csv!(@anki_separator)
    |> convert_from_anki_html_to_md!()
    |> export!(output_path,
      to: :directory,
      answer_separator: @md_answer_separator,
      extension: "md"
    )
  end

  def convert_from_markdown_dir_to_anki!(input_path, output_path) do
    input_path
    |> import_from_markdown_dir!()
    |> convert_from_md_to_html!()
    |> export!(output_path,
      to: :csv,
      answer_separator: IO.chardata_to_string([@anki_separator]),
      note_separator: "\n"
    )
  end

  def convert_from_md_to_html_dir!(input_path, output_path) do
    File.rm_rf!(output_path)
    File.mkdir!(output_path)

    input_path
    |> File.ls!()
    |> Enum.filter(fn file -> file != "index.md" end)
    |> Enum.each(fn filename ->
      in_file_path = Path.join(input_path, filename)
      out_file_path = Path.join(output_path, String.replace(filename, ".md", ".html"))
      IO.puts("Converting #{input_path} to #{out_file_path}")

      Panpipe.pandoc(
        input: in_file_path,
        output: out_file_path,
        css: "assets/styles.css",
        standalone: true,
        self_contained: true
      )
    end)
  end

  def import_from_anki_csv!(input_path, separator) do
    Logger.info("Importing from #{input_path}, separator: '#{to_string([separator])}'")

    csv =
      File.stream!(input_path)
      |> CSV.decode!(separator: separator, headers: false, escape_max_lines: 1000)

    cards =
      Enum.map(csv, fn row ->
        [question | [answer | _]] = row
        tags = Enum.at(row, 2, "") |> String.split() |> Enum.join(" ")
        Logger.info("Parsing question: '#{String.slice(question, 0, 50)}...'")

        {
          question,
          answer,
          tags,
          case Panpipe.pandoc!(question, from: :html, to: :plain) |> String.split("\n") do
            [question, ""] -> question
            [question | _] -> question <> "..."
          end
        }
      end)
      |> Enum.sort(fn {q1, _, _, _}, {q2, _, _, _} -> q1 < q2 end)

    Logger.info("Imported #{length(cards)} cards!")

    cards
  end

  def import_from_markdown_dir!(input_path) do
    input_path
    |> File.ls!()
    |> Enum.sort()
    |> Enum.filter(fn file -> file != "index.md" end)
    |> Enum.map(fn filename ->
      text =
        Path.join(input_path, filename)
        |> File.read!()
        |> String.split("#{@md_answer_separator}\n")
        |> Enum.map(&String.trim/1)

      [question | [answer | _]] = text
      tags = Enum.at(text, 2, "") |> String.split() |> Enum.join(" ")

      {
        question,
        answer,
        tags,
        nil
      }
    end)
  end

  def export!(
        notes,
        output_file,
        to: :csv,
        answer_separator: answer_separator,
        note_separator: note_separator
      ) do
    File.rm(output_file)
    file = File.open!(output_file, [:append])

    Enum.each(notes, fn {question, answer, tags, _} ->
      question = remove_newlines_outside_pre(question)
      answer = remove_newlines_outside_pre(answer)
      IO.binwrite(file, "\"" <> String.replace(question, "\"", "\"\"") <> "\"#{answer_separator}")
      IO.binwrite(file, "\"" <> String.replace(answer, "\"", "\"\"") <> "\"#{answer_separator}")
      IO.binwrite(file, "#{tags}#{note_separator}")
    end)
  end

  def export!(
        notes,
        output_dir,
        to: :directory,
        answer_separator: answer_separator,
        extension: ext
      ) do
    File.rm_rf!(output_dir)
    File.mkdir!(output_dir)
    index_file = Path.join(output_dir, "index.md") |> File.open!([:append])
    IO.binwrite(index_file, "# Questions\n")

    notes
    |> Enum.with_index()
    |> Enum.each(fn {{question, answer, tags, question_line}, index} ->
      filename = "#{index}_#{to_name(question_line, ext: ext)}"
      file = Path.join(output_dir, filename) |> File.open!([:append])

      IO.binwrite(
        file,
        "#{question}#{answer_separator}#{answer}#{answer_separator}#{tags}"
      )

      IO.binwrite(
        index_file,
        "#{index + 1}. [#{question_line}](#{filename})\n"
      )
    end)
  end

  def convert_from_anki_html_to_md!(notes) do
    convert_fn = fn t ->
      Panpipe.pandoc!(t, from: :html, to: :markdown)
      # Remove separation lines (lines with only \)
      |> String.replace("\n\\\n", "")
    end

    Enum.map(notes, fn {question, answer, tags, question_line} ->
      {
        @md_question_title <> convert_fn.(question),
        @md_answer_title <> convert_fn.(answer),
        tags,
        question_line
      }
    end)
  end

  def convert_from_md_to_html!(card) do
    convert_fn = fn text ->
      text
      |> Panpipe.pandoc!(from: :markdown, to: :html)
      |> String.trim()
    end

    Enum.map(card, fn {question, answer, tags, question_line} ->
      {
        question |> String.replace(@md_question_title, "") |> convert_fn.(),
        answer |> String.replace(@md_answer_title, "") |> convert_fn.(),
        tags,
        question_line
      }
    end)
  end

  @doc """
  Generate card filename based on the first line of the question and specified extension.
  """
  defp to_name(question, ext: ext) do
    question
    |> String.replace(~r/[^a-zA-Z\s]/, "")
    |> String.replace(" ", "_")
    |> String.downcase()
    |> String.trim()
    |> (fn s -> s <> "." <> ext end).()
  end

  @doc """
  Removes newlines from card (in HTML format), with the exception of <pre> blocks.
  """
  defp remove_newlines_outside_pre(html_card) do
    outside_pre_blocks = Regex.split(~r/<pre.*?<\/pre>/s, html_card, include_captures: true)

    transformed_outside_pre_blocks =
      Enum.map(outside_pre_blocks, fn part ->
        if String.starts_with?(part, "<pre") do
          part
        else
          String.replace(part, "\n", "")
        end
      end)

    Enum.join(transformed_outside_pre_blocks)
  end
end
