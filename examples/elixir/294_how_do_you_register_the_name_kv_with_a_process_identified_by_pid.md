### Question
how do you register the name \`:kv\` with a process identified by
\`pid\`?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Process.register(pid, :kv)                                            |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

Please note that there\'s also :global.register/2 which registers the
process globally


