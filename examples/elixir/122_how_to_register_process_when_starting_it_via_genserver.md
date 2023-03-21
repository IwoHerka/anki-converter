### Question
How to register process when starting it via GenServer?


### Answer
Use `:name` option, e.g.:
`GenServer.start(__MODULE__, nil, name: __MODULE__)`.


