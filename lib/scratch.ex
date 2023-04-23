defmodule Scratch do
  alias AnkiConverter, as: AC

  def f0 do
    scripts = "<script>#{File.read!("assets/scripts.js")}</script>"

    fonts = """
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono&family=Lexend:wght@300&display=swap" rel="stylesheet">
    """

    sidenav = """
      <div id="preview" class="hidden">
        <button class="hidden" id="close-preview">Close</button>
        <iframe id="preview-iframe" src="" frameborder="0"></iframe>
      </div>

      <div id="sidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>
        <a href="#">Contact</a>
      </div>

      <span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776;</span>
    """

    html =
      File.read!("examples/elixir_fin/7_elixir_allows_you_to_define_you_childspec_as_part_of_your_module_if_you.md")
      |> Panpipe.pandoc!(css: "assets/styles.css", standalone: true, self_contained: true)
      |> String.replace("<body>", "<body>#{sidenav}")
      |> String.replace("<head>", "<head>#{fonts}#{scripts}")

    File.write!("examples/elixir.html", html)
  end

  def f1 do
    AC.convert_from_anki_to_markdown_dir!("examples/elixir.txt", "examples/elixir_out_test")
  end

  def f2 do
    AC.convert_from_markdown_dir_to_anki!("examples/elixir_fin", "examples/elixir_fin_out.csv")
  end

  def f3 do
    AC.convert_from_md_to_html_dir!("examples/elixir_md", "examples/elixir_html")
  end

  def f4 do
    Panpipe.pandoc(
      input: "examples/elixir/0_.md",
      output: "examples/css_test.html",
      css: "/styles.css",
      standalone: true,
      self_contained: true
    )
  end
end
