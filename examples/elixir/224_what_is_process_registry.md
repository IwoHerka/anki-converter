### Question
What is process registry?


### Answer
You need a way to give symbolic names to supervised processes and access
each process via this name. When a process is restarted, the successor
will register itself under the same name, which will allow you to reach
the right process even after multi-ple restarts.\
You could use registered names for this purpose. The problem is that
names can only be atoms, and in this case you need something more
elaborate that will allow you to use arbitrary terms, such as
{:database\_worker, 1}, {:database\_worker, 2}, and so on.\
What you need is a process registry that maintains a key-value map,
where the keys are names and the values are pids. A process registry
differs from standard local registration in that names can be
arbitrarily complex.


