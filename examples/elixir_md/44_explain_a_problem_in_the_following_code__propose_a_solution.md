### Question
Explain a problem in the following code & propose a solution:\

    defmodule Todo.Server do
      use GenServer

      def init(name) do
        {:ok, {name, Todo.Database.get(name) || Todo.List.new()}}
      end

      ...
    end


### Answer
The problem is possibly long-running init/1 callbacks. Recall that
GenServer.start returns only after the process has been initialized.
Consequently, a long-running init/1 function will cause the creator
process to block. In this case, a long initialization of a to-do server
will block the client process. 

<div>

\

</div>

<div>

<div>

<div>

<div>

To circumvent this problem, there's a simple trick. You can use init/1
to send yourself an internal message and then initialize the process
state in the corresponding handle\_info callback:

</div>

</div>

</div>

<div>

<div>

<div>

reading the data

</div>

</div>

</div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| def init(name) do                                                     |
|  send(self(), {:real_init, name})                                     |
|  {:ok, nil}                                                           |
| end                                                                   |
| ...                                                                   |
| def handle_info({:real_init, name}, state) do                         |
|  {:noreply, {name, Todo.Database.get(name) || Todo.List.new()}}       |
| end                                                                   |
| ```                                                                   |
| :::                                                                   |
|                                                                       |
| \                                                                     |
+-----------------------------------------------------------------------+

In the above, example when the client calls GenServer.start(Todo.Server,
\"Bobs\_list\"), he will get the pid immediately although the state is
not initialized. So the client is not blocked for the initialization.
Note: Client is still blocked if he calls GenServer.call before the
:real\_init message is processed by the handle\_info/2 call

</div>

</div>

</div>

</div>


