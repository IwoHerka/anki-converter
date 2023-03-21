### Question
When a process will implicitly yield execution to the scheduler before
its execution time is up?


### Answer
`Process.sleep/1`, `receive` or when calling I/O operations, which are
internally executed on separate threads called async threads. When
issuing an I/O call, the calling process is preempted, and other
processes get the execution slot. After the I/O operation finishes, the
scheduler resumes the calling process.


