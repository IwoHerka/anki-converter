### Question
What is the difference between \`spawn\_link\` and \`spawn\_monitor\`?


### Answer
*Linking* joins the calling process and spawned process---each receives
notifications about the other. By contrast, *monitoring* lets a process
spawn another and be notified of its termination, but without the
reverse notification---it is one-way only(spawned-process to calling
process).

In linking, a process receives an :EXIT message when the other process
exits or fails, or if it doesn't exist. When you monitor a process, you
receive a :DOWN message when it exits or fails, or if it doesn't exist.

If the intent is that a failure in one process should *terminate*
another, then you need links. If instead you *need to know* when some
other process exits for any reason, choose monitors.

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
defmodule Monitor1 do   import :timer, only: [ sleep: 1 ]    def sad_function do     sleep 500     exit(:boom)   end   def run do     res = spawn_monitor(Monitor1, :sad_function, [])     IO.puts inspect res     receive do       msg ->         IO.puts "MESSAGE RECEIVED: #{inspect msg}"     after 1000 ->         IO.puts "Nothing happened as far as I am concerned"     end   end end 
```
:::

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
$ elixir -r monitor1.exs {#PID<0.78.0>, #Reference<0.1328...>} MESSAGE RECEIVED: {:DOWN, #Reference<0.1328...>, :process,                       #PID<0.78.0>, :boom} 
```
:::


