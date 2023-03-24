### Question
What is the relationship between supervisors and process pegistry? Why?


### Answer
Using supervisor, requires rich process discovery, typically via process
registry. If a process is started from a supervisor, you don't have
access to its PID.. This is a property of supervisors. You can't keep a
worker's PID for a long time because that process might be restarted,
and its successor will have a different PID. Therefore, you need a way
to give symbolic names to supervised processes and access each process
via this name. When a process is restarted, the successor will register
itself under the same name, which will allow you to reach the right
process even after multiple restarts. This is typically achieved via
`Registry` module.


