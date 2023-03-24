### Question
Why when spawning processes you should be careful what is in current
closure?


### Answer
Because data\* will be deep-copied to new process which can be slow and
consumes memory.\
\
\*Except for binaries.


