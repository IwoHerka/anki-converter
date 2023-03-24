### Question
What is the difference between 

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| &&, ||, !                                                             |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

<div>

and\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| and, or, not                                                          |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


### Answer
They both are boolean short-circuit operators. Only difference is that
(and,or,not) require LHS value to be strict boolean. For example,

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> false                                                         |
| or 6 6 iex(2)> 6 or false ** (BadBooleanError) expected a boolean on  |
| left-side of "or", got: 6  iex(3)> false || 6 6 iex(4)> 6 || false 6  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


