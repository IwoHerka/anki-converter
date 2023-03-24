### Question
what happens when you run the following code? 

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| spawn_link fn -> raise "oops" end                                     |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


### Answer
an errors is logged and the parent process dies.


