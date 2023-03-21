### Question
Why GC is fast in Elrang/Elixir?


### Answer
Erlang processes are completely isolated and share no memory. This
allows per-process garbage collection: instead of stopping the entire
system, each process is individually collected as needed. Such
collections are much quicker and don't block the entire system for long
periods of time. In fact, in a multicore system, it's possible for one
CPU core to run a short garbage collection while the remaining cores are
doing standard processing.


