### Question
What is the purpose of `GenServer.handle_info` callback?


### Answer
`handle_info/2` is invoked for all messages which are not handled by
`handle_cast` and `handle_call`. `msg` is the message and state is the
current state of the GenServer. When a timeout occurs the message is
`:timeout`. Return values are the same as ` handle_cast/2`. This
callback is optional. If one is not implemented, the received message
will be logged.


