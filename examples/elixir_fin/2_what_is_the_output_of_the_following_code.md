### Question
What is the output of the following code?

```
spawn(fn ->
  spawn_link (fn ->
      Process.sleep(1000)
      IO.puts("Process 2 finished")
  end)              |

  raise("Something went wrong in Process 1")
end)
```


### Answer
```
#PID<0.140.0>  15:00:40.443 [error] in Process 1    
(stdlib) erl_eval.erl:678: :erl_eval.do_apply/6
```

[`Kernel.spawn_link/1`](https://hexdocs.pm/elixir/Kernel.html#spawn_link/1)
connects exactly two processes and is always bidirectional. Even though Process
2 is sleeping, because Process 1 terminated abnormally, which caused an exit
signal emitted to Process 2. As a result Process 2 exits as well.


processes
