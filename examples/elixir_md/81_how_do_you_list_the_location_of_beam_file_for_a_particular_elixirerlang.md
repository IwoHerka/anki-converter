### Question
How do you list the location of beam file for a particular Elixir/Erlang
module?


### Answer
<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> :code.which String        '/usr/                                 |
| local/Cellar/elixir/1.6.4/bin/../lib/elixir/ebin/Elixir.String.beam'  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


