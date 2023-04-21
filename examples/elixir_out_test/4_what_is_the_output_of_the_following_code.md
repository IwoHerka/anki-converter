### Question
What is the output of the following code?

::: {#cb1 .sourceCode}
``` {.sourceCode .elixir}
spawn(fn ->   spawn_link (fn ->       Process.sleep(1000)       IO.puts("Process 2 finished")   end)              |     raise("Something went wrong in Process 1") end)
```
:::

### Answer

::: {#cb2 .sourceCode}
``` {.sourceCode .elixir}
#PID<0.140.0>  15:00:40.443 [error] Process                            ong in Process 1     (stdlib) erl_eval.erl:678: :erl_eval.do_apply/6
```
:::

`spawn_link/1` connects exactly two processes and is always
bidirectional. Even though Process2 is sleeping, because Process 1
terminated abnormally, which caused an exit signal emitted to Process 2;
As a result Process 2 exits as well.


### Answer
processes


