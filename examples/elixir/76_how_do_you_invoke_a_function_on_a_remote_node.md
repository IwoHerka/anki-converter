### Question
How do you invoke a function on a remote node?


### Answer
::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
iex(node1@katbookpro)4> Node.connect(:node2@katbookpro) true iex(node1@katbookpro)7> Node.spawn(:node2@katbookpro, fn->File.ls! |> Enum.join(",")|>IO.puts end) #PID<10406.101.0> pin.exs,Lists,fizzbuzz.exs,Enum,Maps_KW,Binaries 
```
:::


