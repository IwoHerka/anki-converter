### Question
How would you write an Agent using GenServer? API should be like this:

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(3)> {:ok, pid}=GenServerAsAgent.                                  |
| start_link(fn ->0 end)  {:ok, #PID<0.116.0>} iex(4)> GenServerAsAgent |
| .get(pid, fn x-> x end) 0 iex(5)> GenServerAsAgent.put(pid, fn x-> x+ |
| 1 end)    :ok iex(6)> GenServerAsAgent.get(pid, fn x-> x end)      1  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule GenServerAsAgent do use GenServer  def                      |
|  start_link(init_fun) do  GenServer.start_link(__MODULE__, init_fun)  |
| end  def get(pid, fun) do  GenServer.call(pid, {:get, fun}) end  def  |
| put(pid, fun) do  GenServer.call(pid, {:update, fun}) end  def init(i |
| nit_fun) do  {:ok, init_fun.()} end  def handle_call({:get,fun}, _cal |
| ler, state) do  {:reply, fun.(state), state} end  def handle_call({:u |
| pdate, fun}, _caller, state) do  {:reply, :ok, fun.(state)} end  end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\


