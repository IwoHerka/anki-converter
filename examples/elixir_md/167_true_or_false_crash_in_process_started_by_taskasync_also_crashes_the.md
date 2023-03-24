### Question
True or False: Crash in process started by Task.async/1 also crashes the
process that started it


### Answer
True, Task.async/1 links the new task to the starter process. Therefore,
if you are starting multiple tasks and if any task process crashes, the
starter process will crash too (unless it's trapping exits). The crash
of the starter process will, in turn, cause all the other tasks started
by the same process to crash. In other words, starting multiple tasks
with Task.async/1 has all-or-nothing semantics. The crash of a single
task takes down all other tasks as well as the starter process. 


