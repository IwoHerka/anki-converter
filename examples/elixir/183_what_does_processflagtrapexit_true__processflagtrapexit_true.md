### Question
What does
`Process.flag(:trap_exit, true) | process_flag(trap_exit, true)` does?


### Answer
When trap\_exit is set to true, exit signals arriving to a process are
converted to {\'EXIT\', From, Reason} messages, which can be received as
ordinary messages. If trap\_exit is set to false, the process exits if
it receives an exit signal other than normal and the exit signal is
propagated to its linked processes. Application processes are normally
not to trap exits.


