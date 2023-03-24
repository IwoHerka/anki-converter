### Question
How does BEAM avoid deadlocks and process starvation?


### Answer
Elrang\'s scheduler is preemptive---it gives a small execution window to
each process and then pauses it and runs another process. Because the
execution window is small, a single long-running process can't block the
rest of the system. Furthermore, I/O operations are internally delegated
to separate threads, or a kernel-poll service of the underlying OS is
used if available. This means any process that waits for an I/O
operation to finish won't block the execution of other processes.


