### Question
What is pattern matching and assignment operation (=) mean?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Pattern = Expression                                                  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

In a pattern matching operation, the expression on RHS is matched
against the pattern on LHS and the value form the expression is
**bound/assigned** the pattern.

<div>

\

</div>

<div>

For the pattern matching to work, all fields from the expression should
be matching the pattern otherwise an error will be thrown. For example,

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> %Fraction{} = %{a: 1, b:                                         |
| 2}  ** (MatchError) no match of right hand side value: %{a: 1, b: 2}  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

<div>

<div>

When matching a map to a struct pattern, this isn't the case, because
%Fraction{} contains the field struct, which isn't present in the map
being matched.\

</div>

</div>

<div>

<div>

\

</div>

<div>

This is equivalent to below:

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> %{__struct__: Fraction, a: a, b: b} = %{ a: 1, b: 2}             |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| ** (MatchError) no match of right hand side value: %{a: 1, b: 2}      |
| ```                                                                   |
|                                                                       |
| <div>                                                                 |
|                                                                       |
| \                                                                     |
|                                                                       |
| </div>                                                                |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>


