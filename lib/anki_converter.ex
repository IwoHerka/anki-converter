defmodule AnkiConverter do
  require Logger

  @anki_separator ?\t

  @md_answer_separator "\n\n"

  @md_question_title "### Question\n"
  @md_answer_title "### Answer\n"

  def f1 do
    convert_from_anki_to_markdown_dir!("examples/anki.csv", "examples/output_md")
  end

  def f2 do
    convert_from_markdown_dir_to_anki!("examples/output_md", "examples/anki.csv")
  end

  def f3 do
    convert_from_anki_to_html_dir!("examples/anki.csv", "examples/output_html")
  end

  def convert_from_anki_to_markdown_dir!(input_path, output_path) do
    input_path
    |> import!(from: :anki_csv, separator: @anki_separator)
    |> convert_from_html_to_md!()
    |> export!(output_path,
      to: :directory,
      answer_separator: @md_answer_separator,
      extension: "md"
    )
  end

  def convert_from_markdown_dir_to_anki!(input_path, output_path) do
    input_path
    |> import!(from: :markdown_dir)
    |> convert_from_md_to_html!()
    |> export!(output_path,
      to: :csv,
      answer_separator: IO.chardata_to_string([@anki_separator]),
      note_separator: "\n"
    )
  end

  def convert_from_anki_to_html_dir!(input_path, output_path) do
    input_path
    |> import!(from: :anki_csv, separator: @anki_separator)
    |> convert_from_html_to_md!()
    |> export!(output_path,
      to: :directory,
      answer_separator: @md_answer_separator,
      extension: "md"
    )
  end

  def import!(input_path, from: :anki_csv, separator: separator) do
    csv = File.stream!(input_path) |> CSV.decode!(separator: separator, headers: false)

    Enum.map(csv, fn row ->
      [question | [answer | _]] = row
      tags = Enum.at(row, 2, "") |> String.split() |> Enum.join(" ")
      {
        question,
        answer,
        tags,
        # TODO: This needs to remove HTML
        case question |> String.split("\n") do
          [question, ""] -> question
          [question | _] -> question <> "..."
        end
      }
    end)
  end

  def import!(input_path, from: :markdown_dir) do
    input_path
    |> File.ls!()
    |> Enum.filter(fn file -> file != "index.md" end)
    |> Enum.map(fn filename ->
      text =
        Path.join(input_path, filename)
        |> File.read!()
        |> String.split("#{@md_answer_separator}\n")

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

  def convert_from_html_to_md!(notes) do
    convert_fn = &Panpipe.pandoc!(&1, from: :html, to: :markdown)

    Enum.map(notes, fn {question, answer, tags, question_line} ->
      {
        @md_question_title <> convert_fn.(question),
        @md_answer_title <> convert_fn.(answer),
        tags,
        question_line
      }
    end)
  end

  def convert_from_md_to_html!(notes) do
    convert_fn = fn text ->
      text
      |> Panpipe.pandoc!(from: :markdown, to: :html)
      |> String.replace("\n", "")
    end

    Enum.map(notes, fn {question, answer, tags, question_line} ->
      {
        convert_fn.(question |> String.replace(@md_question_title, "")),
        convert_fn.(answer |> String.replace(@md_answer_title, "")),
        tags,
        question_line
      }
    end)
  end

  def to_name(question, ext: ext) do
    question
    |> String.replace(~r/[^a-zA-Z\s]/, "")
    |> String.replace(" ", "_")
    |> String.downcase()
    |> String.trim()
    |> (fn s -> s <> "." <> ext end).()
  end
end
