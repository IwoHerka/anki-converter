### Question
Here\'s a Simple GenServer behavior implementation:

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule KeyValueStore do                                            |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  use GenServer  def init(_) do   {:ok,%{}}  end                       |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  def handle_cast({:                                                   |
| put, key, value}, map) do   {:noreply, Map.put(map, key, value)}  end |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  def handle                                                           |
| _call({:get, key}, _, map) do   {:reply, Map.get(map, key), map}  end |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| ####INTERFACE FUNCTIONS######                                         |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  de                                                                   |
| f start() do   {:ok, pid}=GenServer.start(__MODULE__, nil)   pid  end |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  def set(server_pid,                                                  |
| key, value ) do   GenServer.cast(server_pid, {:put, key, value})  end |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  def get(se                                                           |
| rver_pid, key) do   GenServer.call(server_pid, {:get, key})  end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

How do you convert it to a **Supervised** server?

</div>

</div>

</div>


### Answer
1\. Change the interface function start to start\_link/1 that takes one
argument and ignore it. This is because when the supervisor starts it
calls start\_link/1 in child modules

<div>

\

<div>

2\. Change GenServer.start/3 to **GenServer.start\_link/3** to start the
GenServer as a linked process to the current process.

</div>

<div>

\

</div>

<div>

3\. Finally, in the client code, call Supervisor.start\_link/2:\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Supervisor.start_link([KeyValueStore], strategy: :one_for_one)        |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule KeyValueStore do   use GenServer    def                     |
|  init(_) do     {:ok,%{}}   end    def handle_cast({:put, key, value} |
| , map) do     {:noreply, Map.put(map, key, value)}   end    def handl |
| e_call({:get, key}, _, map) do     {:reply, Map.get(map, key), map}   |
|  end    def start_link(_) do     GenServer.start_link(__MODULE__, nil |
| , name: __MODULE__)   end    def set(server_pid, key, value ) do      |
| GenServer.cast(server_pid, {:put, key, value})   end    def get(serve |
| r_pid, key) do     GenServer.call(server_pid, {:get, key})   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>


