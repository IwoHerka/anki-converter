### Question
How do Erlang processes communicate?


### Answer
Sharing no memory, processes communicate via asynchronous messages. This
means there are no complex synchronization mechanisms such as locks,
mutexes, or semaphores. 


