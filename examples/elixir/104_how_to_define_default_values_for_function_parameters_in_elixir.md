### Question
How to define default values for function parameters in Elixir?


### Answer
Using the `//`, for example:

    def foo(x, y // 7) do
      ...
    end


