### Question
How to start Elixir\'s GenServer?


### Answer
Via `GenServer`\'s `start/2` or `start_link/3`. The function accepts a
module, initial argument for `init` and options, such as `:name`. For
example:\

    GenServer.start_link(Stack, [:hello], name: Stack)


