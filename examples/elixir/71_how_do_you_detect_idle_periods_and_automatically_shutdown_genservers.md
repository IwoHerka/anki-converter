### Question
How do you detect idle periods and automatically shutdown GenServers?


### Answer
<div>

<div>

<div>

In values returned from GenServer callbacks, you can include **one extra
element at the end of the return tuple**. This element, if it's an
integer, represents an idle time after which the timeout message is sent
to the GenServer process. 

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

For example, in init/1, instead of returning {:ok, initial\_state}, you
can return {:ok, initial\_state, 1000}. The value of 1000 states that if
no call, cast, or plain message arrives to the server process in 1,000
milliseconds, the **handle\_info/2** callback will be invoked, and the
first argument will have the value of :timeout.

</div>

<div>

The same thing holds true for other callbacks, such as handle\_cast/2
and handle\_ call/3, where you can return {:noreply, new\_state,
timeout} and {:reply, response, new\_state, timeout} respectively. 

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| def handle_info(:timeout, {name, todo_list}) do  IO.puts("Stopping    |
|  to-do server for #{name}")  {:stop, :normal, {name, todo_list}} end  |
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


