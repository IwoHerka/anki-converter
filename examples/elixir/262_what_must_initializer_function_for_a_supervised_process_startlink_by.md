### Question
What must initializer function for a supervised process (`start_link/1`
by default) return?


### Answer
The `start_link/1` function must return `{:ok, pid}` where pid is the
process identifier of a new process that is linked to the supervisor.


