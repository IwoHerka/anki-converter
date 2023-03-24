### Question
What is the difference between Process.register/2,
Elixir.Registry.register/2 and :global.register/2?


### Answer
Both Process.register/2 and Registry.register/2 are or local
registration within a single node. :global.register/2 is a registration
mechanism for distributed system consisting of multiple nodes. In
Process.register/2 you can only use an atom is as a registration name
but Elixir Registry allows an arbitrary term

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> Process                                                          |
| .register(:thing, pid)  iex> Process.whereis(:thing)  #PID<0.134.00>  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex>                                                                  |
| Registry.start_link(:unique, :registry)  {:ok, #PID<0.139.0>}  iex> R |
| egistry.register(:registry, :thing, self()) {:ok, #PID<0.147.0>} iex> |
|  Registry.lookup(:registry, :thing) [{#PID<0.110.0>, #PID<0.110.0>}]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

\

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node1@localhost)10> :                                             |
| global.register_name({:todo_list, "bob"}, self())  :yes  iex(node2@lo |
| calhost)8> :global.whereis_name({:todo_list, "bob"}) #PID<7954.90.0>  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

<div>

<div>

<div>

</div>

</div>

</div>

</div>

</div>

</div>

</div>


