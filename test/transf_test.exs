defmodule X do
  def deserialize(string) do
    string
    |> String.replace("<br>", "\n")
  end

  def serialize(string) do
    string
    |> String.replace("\n", "<br>")
  end
end

defmodule TransfTest do
  use ExUnit.Case
  doctest Transf

  test "anki export import" do
    csv_file = Transf.convert()
  end

  test "earmark" do
    {:ok, html, _} = Earmark.as_html(@input)

    File.write!("examples/output.html", html)
    assert true
  end

  test "pandoc" do
    {:ok, markdown} =
      Panpipe.pandoc(File.read!("examples/output.html"), from: :html, to: :markdown)

    File.write!("examples/output.md", markdown)
    assert true
  end
end
