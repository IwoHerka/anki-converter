### Question
What is a basic concurrency primitive in Erlang?


### Answer
Elrang process. Erlang can run millions of such processes. BEAM uses its
own schedulers to distribute the execution of processes over the
available CPU cores, thus parallelizing execution as much as possible.


