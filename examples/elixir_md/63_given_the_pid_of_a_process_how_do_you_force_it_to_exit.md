### Question
Given the PID of a process, how do you force it to exit?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex>Process.exit(pid, :kill)                                          |
| true                                                                  |
| ```                                                                   |
| :::                                                                   |
|                                                                       |
| \                                                                     |
+-----------------------------------------------------------------------+

\
   


