### Question
How do you create a long running, stateful server without Genserver?


### Answer
<div>

<div>

<div>

<div>

In particular, all code that implements a server process needs to do the
following:

</div>

<div>

\* Spawn a separate process\
\* Run an infinite loop in the process 

</div>

<div>

\* Maintain the process state\
\* React to messages\
\* Send a response back to the caller 

</div>

<div>

</div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule TodoApp do   def start() do     #1. Spawn a separate proces |
|      spawn(fn -> TodoList.new |> loop() end)   end    def add_entry(p |
| id, %{}=item) do     send(pid, {:add_todo, item})   end    def entrie |
| s(pid, %Date{}=date) do     send(pid,{:get_entries, self(), date})    |
|   receive do       {:entries, value} ->         value     end    end  |
|    def loop(state) do     # 3. Maintain the process state (by capturi |
| ng creaing new state)     new_state =       receive do         # 4. R |
| eact to messages         {:add_todo, value} -> TodoList.add_entries(s |
| tate, value)         {:get_entries, caller, date} ->             #5.  |
| Send a response back to the caller             send(caller, {:entries |
| , TodoList.entries(state, date)})             state       end     # 2 |
| . Run an infinite loop in the process      loop(new_state)   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>


