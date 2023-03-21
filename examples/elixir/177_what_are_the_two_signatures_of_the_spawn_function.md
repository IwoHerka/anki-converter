### Question
What are the two signatures of the `spawn` function?


### Answer
-   `spawn/1` takes an anonymous function that takes 0 arguments:\

        iex> spawn(fn -> IO.puts("greet") end)
        greet
        #PID<0.90.0>

-   `spawn/3` takes a module name, named function and an argument list:\

        defmodule SpawnBasic do
          def greet(msg) do
            IO.puts msg
          end
        end
        spawn(SpawnBasic, :greet, ["hello"])


