### Question
How do you start an Agent for an empty list?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| {:ok, agent_pid} = Agent.start_link(fn -> [] end)                     |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+


