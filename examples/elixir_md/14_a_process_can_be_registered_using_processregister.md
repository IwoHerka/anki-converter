### Question
A process can be registered using Process.register/1.

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> Process                                                          |
| .register(:thing, pid)  iex> Process.whereis(:thing)  #PID<0.134.00>  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

Elixir's standard library also includes the implementation of a process
registry in the Registry module 

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex> Registry.start_link(name: :registry, keys: :unique)              |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| {:ok, #PID<0.139.0>}                                                  |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| iex> Registry.register(:registry, :thing, nil)  {:ok, #PID<0.140.     |
| 0>}  iex> Registry.lookup(:registry, :thing)  [{#PID<0.126.0>, nil}]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

Why there are two APIs to do the same job?

</div>

</div>

</div>

</div>

</div>


### Answer
This module allows you to associate a process with one or more arbitrary
complex keys, and then find the process (its pid) by doing a key-based
lookup. In other words, Registry lets you use any term, not just atoms,
so you can use it for dynamically created processes. This allows you to
register processes using arbitrary terms such as {:database\_worker, 1},
{:database\_worker, 2}, and so on. 


