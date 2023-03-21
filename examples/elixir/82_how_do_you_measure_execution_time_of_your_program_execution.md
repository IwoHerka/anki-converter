### Question
How do you measure execution time of your program execution?


### Answer
call it with the function

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
:timer.tc(Module, Function, Arguments) -> {Time, Value} 
```
:::

where `Time` is in milliseconds

For example,

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
iex(8)> :timer.tc(String, :split, ["hello world"])  {116, ["hello", "world"]} 
```
:::


