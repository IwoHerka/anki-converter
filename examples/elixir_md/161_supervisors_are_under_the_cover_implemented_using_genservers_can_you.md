### Question
Supervisors are under the cover implemented using GenServers. Can you
think about writing your own using GenServers?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule GenServerSupervisor do   use GenServer    # Client API #    |
|   def start_link(child_specs_list) do     GenServer.start_link(__MODU |
| LE__, child_specs_list)   end    # Server API #   def init(child_spec |
| s_list) do     Process.flag(:trap_exit, true)     state = child_specs |
| _list |> start_children |> Enum.into(%{})     {:ok, state}   end    d |
| ef handle_info({:EXIT, from, reason}, state) do     case Map.get(stat |
| e, from) do       nil -> {:noreply, state}       child_spec ->        |
|   {:ok, pid} = start_child(child_spec)         new_state = Map.delete |
| (state, from) |> Map.put(pid, child_spec)         {:noreply, new_stat |
| e}     end   end    # Helper Functions #   defp start_children([child |
| _spec | rest]) do     case start_child(child_spec) do       {:ok, pid |
| } ->         [{pid, child_spec} | start_children(rest)]       :error  |
| -> :error     end   end    defp start_children([]), do: []    defp st |
| art_child({module, fun, args}) do     case apply(module, fun, args) d |
| o       {:ok, pid} -> {:ok, pid}       _ -> :error     end   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\


