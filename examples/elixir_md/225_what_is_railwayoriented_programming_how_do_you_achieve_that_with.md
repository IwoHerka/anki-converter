### Question
What is railway-oriented programming? How do you achieve that with
Elixir?


### Answer
It is a clean, functional approach to error handling where the happy
path follows success path and failure path follows error path. In elixir
it can be achieved using `with` operator

Previously, one would write

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
case File.read("my_file.ex") do   {:ok, contents} ->     case Code.eval_string(contents) do       {res, _binding} ->         {:ok, res}       error ->         error   error -> error     error end 
```
:::

such can now be rewritten as

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
with {:ok, contents} <- File.read("my_file.ex"),      {res, binding} <- Code.eval_string(contents),      do: {:ok, res} 
```
:::

Every statement of with is executed in order. Execution continues as
long as left \<- right match. As soon as a match fails, the else block
is executed. Within the else block we can match against whatever WAS
returned. If all statements match, the do block is executed and has
access to all the local variables in the with block.


