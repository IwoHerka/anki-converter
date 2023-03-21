### Question
GenServer synchronous(GenServer.call/3) calls don\'t block indefinitely,
True or False?


### Answer
True. GenServer.call has a default timeout of five seconds. This can be
overriden by passing a custom ms value as the 3rd arg

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| call(server, request, timeout)                                        |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


