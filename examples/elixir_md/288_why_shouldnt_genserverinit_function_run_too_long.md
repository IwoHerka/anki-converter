### Question
Why shouldn\'t `GenServer.init/1` function run too long?


### Answer
The supervisor starts a child, waits for it to fi nish, and then moves
on to start the next child. When the worker is a GenServer, the next
child is started only after the init/1 callback function for the current
child is fi nished.\
You may recall from chapter 7 that init/1 shouldn't run for a long time.
This is precisely why. If Todo.Database was taking, say, fi ve minutes
to start, you wouldn't have the to-do cache available all that time.
Always make sure your init/1 functions run quickly, and use the trick
mentioned in chapter 7 (a process that sends itself a message during
initial-ization) when you need more complex initialization.


