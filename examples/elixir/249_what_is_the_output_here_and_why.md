### Question
What is the output here and why?

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node1@localhost)> Nod                                             |
| e.spawn( :node2@localhost, fn -> IO.puts("Hello from #{node}") end )  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Hello from node2@localhost #PID<11132.128.0>                          |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

<div>

Even though the lambda has been executed on node2, the output is printed
in the shell of node1. All standard I/O calls (such as IO.puts/1) are
forwarded to the group leader --- a process that's in charge of
performing the actual input or output. A spawned process inherits the
group leader from the process that spawned it, even when you're spawning
a process on another node. Therefore, your process may run on node2, but
its group leader is still on node1. As a consequence, the string to be
printed is created on node2 (as the string con- tents prove), but the
output is printed on node1.

</div>

<div>

\

</div>

<div>

This code won\'t print anything on node1 as there\'s no IO calls
involved,

</div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node1@localhost)>Node.spawn(:"node2@al                            |
| ice-mbp", fn-> "Hello from #{node()}" end)          #PID<11132.129.0> |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

</div>

\

</div>

</div>

</div>

</div>

</div>


