### Question
What is the result of the following two invocations?

```elixir
spawn_link(fn -> Process.sleep(4000); IO.puts("ending") end)
spawn_link(fn -> Process.sleep(4000); raise("ending") end)
```


### Answer
First one prints `"ending"` after 4 seconds and gracefully exits. Second
one causes the child process to quit abnormally, which causes the parent
process in this case (IEx shell) to exit as well.


```
Process #PID<0.147.0> raised an exception ** (RuntimeError) ending
(stdlib) erl_eval.erl:678: :erl_eval.do_apply/6
```


processes
