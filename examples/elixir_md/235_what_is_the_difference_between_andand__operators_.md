### Question
What is the difference between *and* and && operators ?


### Answer
<div>

Elixir provides short-circuiting logical boolean operators *and, or, &&,
and \|\|.* The *and* and *or* operators are said to be **strict**
because they only accept booleans and return a boolean result. The pipes
\|\| and ampersands && are non-strict/relaxed and can take any value.
The values false and nil are the only falsey values and everything else
is true.

\

Use **and** or **or** when you have boolean inputs and want a boolean
result.

\
\
\

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(2)> "hello" and false ** (BadBooleanError) expected a boolean     |
|  on left-side of "and", got: "hello"  iex(2)> "hello" && false false  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


