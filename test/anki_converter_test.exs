defmodule AnkiConverterTest do
  use ExUnit.Case
  doctest AnkiConverter

  test "convert_from_anki_to_markdown_dir!/2" do
    AnkiConverter.convert_from_anki_to_markdown_dir!("test/assets/example_deck.csv")
  end

  test "convert_from_anki_html_dir!/2" do
  end

  test "convert_from_markdown_dir_to_anki!/2" do
  end

  test "import_from_anki_csv!/2" do
  end

  test "import_from_markdown_dir!/1" do
  end
end
