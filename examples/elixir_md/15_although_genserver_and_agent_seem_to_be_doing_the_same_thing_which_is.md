### Question
Although GenServer and Agent seem to be doing the same thing which is
managing state in a long running process, what is one shortcoming with
Agent and how do you tackle that?


### Answer
<div>

<div>

<div>

<div>

One problem with agents is that they completely open the process's
state. Recall that with GenServer, the **state is private to the
server** and can only be manipulated via well-defined messages. For
example,

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| GenServer.cast(counter_server_pid, :increment)                        |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

the actualy increment logic is hidden from the client. With an Agent,
though, the state can be manipulated in an arbitrary way through lambdas
passed to Agent functions, which means the state is prone to accidental
corruption 

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Agent.update(counter_server_pid, fn x->x+5 end)                       |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

<div>

To guard against this problem, you're advised to always wrap an agent in
a dedicated module, and to only manipulate the agent process through
functions of that module. For example,

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| def inc                                                               |
| rement(pid) do   Agent.update(counter_server_pid, fn x->x+5 end) end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

</div>

</div>

</div>

</div>

</div>

</div>


