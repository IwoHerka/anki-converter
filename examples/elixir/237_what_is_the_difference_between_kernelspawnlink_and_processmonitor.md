### Question
What is the difference between Kernel.spawn\_link and Process.monitor/1?


### Answer
<div>

<div>

<div>

<div>

There are two main differences between monitors and links. First,
monitors are unidirectional --- only the process that created a monitor
receives notifications. In addition, unlike a link, the observer process
won't crash when the monitored process terminates. Instead, a message is
sent, which you can handle or ignore. 

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(3)> target_pid = spawn(fn -> Process.sleep(20000) end) #PID<0.16  |
| 0.0> iex(4)> Process.monitor(target_pid)                        #Refe |
| rence<0.666283299.2325217283.165544> iex(5)> receive do               |
|                            ...(5)>  msg-> IO.inspect(msg)             |
|                  ...(5)> end {:DOWN, #Reference<0.666283299.232521728 |
| 3.165544>, :process, #PID<0.160.0>, :normal} {:DOWN, #Reference<0.666 |
| 283299.2325217283.165544>, :process, #PID<0.160.0>, :normal} iex(6)>  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

</div>


