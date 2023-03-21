### Question
What is the difference between Task.async(fun) and
Task.start\_link(fun)?


### Answer
Task.async(and Task.await) sends the result message back to the starter
process. Sometimes the starter process doesn't need to be notified about
the task's outcome. For example, let's say that when handling a web
request you start a longer-running task that communicates with the
payment gateway. You could start the task and immediately respond to the
user that the request has been accepted. Once the task is done, the
server would issue a notification about the outcome, perhaps via
WebSocket or an email. Or suppose a task needs to produce a side effect,
such as a database update, **without notifying the starter process**. 

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> task=Task.async(fn -> Process.sleep(2_000); "blah" end)       |
|                %Task{                                                 |
|                            owner: #PID<0.366.0>,   pid: #PID<0.387.0> |
| ,   ref: #Reference<0.3892106341.61079555.177231> } iex(2)> Task.awai |
| t(task)                                                       "blah"  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

\

</div>

<div>

Notice that the message \"blah\" returned back to iex shell

</div>

<div>

\

</div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(6)> task=Task.start_link(fn                                       |
|  -> Process.sleep(2_000); "blah" end)           {:ok, #PID<0.385.0>}  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

<div>

      

</div>

<div>

\

</div>

<div>

You will never see the result message from started process printed in
iex.                                    \

</div>

<div>

\

</div>


