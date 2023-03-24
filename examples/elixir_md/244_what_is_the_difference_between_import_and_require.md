### Question
What is the difference between import and require?


### Answer
import directive when used with module name automatically **brings all
functions and macros** into the current namespace. Require on the
otherhand **only brings the macros**. Import directive behind the scenes
uses Require directive to import the macros.

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule Condi                                                       |
| tional do   defmacro custom_unless(clause, do: expression) do   quote |
|  do    if(!unquote(clause), do: unquote(expression)) end    end  end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> Conditional.custom_unless 2 < 1, do: IO.puts "It works!"         |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| ** (CompileError) iex: you must requi                                 |
| re Conditional before invoking the macro Conditional.custom_unless/2  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

When used with import or require

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> require Conditional                                              |
| Conditional  iex> Conditional.custom_unless 2 < 1, do: IO.puts "It wo |
| rks!"  It works!  :ok  iex> import Conditional  Conditional iex> Cond |
| itional.custom_unless 2 < 1, do: IO.puts "It works!"  It works!  :ok  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


