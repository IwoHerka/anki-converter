### Question
How do you call an Erlang function from Elixir?


### Answer
Using the following syntax:

    :module.function()

For example:

    :erlang.system_info(:process_count)


