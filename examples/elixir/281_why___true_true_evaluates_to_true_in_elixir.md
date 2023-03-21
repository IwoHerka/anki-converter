### Question
Why `1 < true` true evaluates to true in Elixir?


### Answer
Because types in Elixir are orderable according to the following rule:
 [number \< atom \< reference \< fun \< port \< pid \< tuple \< list \<
bit
string.]{style="background-color: rgb(238, 255, 204); color: rgb(85, 85, 85); font-family: Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace; font-size: 1.1em;"}


