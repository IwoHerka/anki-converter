### Question
What is the Shell command to list Erlang nodes and their listening
ports?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| % epmd -names epmd: up and running on po                              |
| rt 4369 with data: name node3 at port 61317 name node2 at port 61315  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

Remember that epmd is a OS process that gets started when a first BEAM
instance started on a computer


