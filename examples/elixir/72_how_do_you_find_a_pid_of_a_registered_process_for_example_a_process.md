### Question
How do you find a PID of a registered process? For example, a process
registered under the name `KeyValueStore`?


### Answer
    iex(1)> pid = Process.whereis(KeyValueStore)
    #PID<0.229.0>


