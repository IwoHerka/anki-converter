defmodule Scratch do
  alias AnkiConverter, as: AC

  def f1 do
    AC.convert_from_anki_to_markdown_dir!("examples/elixir.txt", "examples/elixir")
  end

  def f2 do
    AC.convert_from_markdown_dir_to_anki!("examples/elixir", "examples/elixir_out.csv")
  end

  def f3 do
    AC.convert_from_anki_to_html_dir!("examples/anki.csv", "examples/output_html")
  end
end