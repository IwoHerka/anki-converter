### Question
What is Inspect protocol?


### Answer
The `Inspect` protocol is responsible for converting any Elixir data
structure into an algebra document. This document is then formatted,
either in pretty printing format or a regular one.

The `inspect/2` function receives the entity to be inspected followed by
the inspecting options, represented by the struct Inspect.Opts.

Many times, inspecting a structure can be implemented in function of
existing entities. For example, here is MapSet's inspect implementation:

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
defimpl Inspect, for: MapSet do   import Inspect.Algebra    def inspect(dict, opts) do     concat(["#MapSet<", to_doc(MapSet.to_list(dict), opts), ">"])   end end 
```
:::

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
iex(20)> inspect a "#MapSet<[\"abc\", \"def\", \"ghi\"]>" 
```
:::


