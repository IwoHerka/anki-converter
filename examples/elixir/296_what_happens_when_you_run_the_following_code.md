### Question
what happens when you run the following code? 

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| spawn fn -> raise "oops" end                                          |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


### Answer
an error is logged, but the parent process remains alive


