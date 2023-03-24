### Question
How to send data to a process? (Elixir)


### Answer
Use `Kernel.send/2`, e.g.:\
\
`send(pid, {:an, :arbitrary, :term})`


