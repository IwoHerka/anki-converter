### Question
What are guard clauses?


### Answer
Guard clauses are a way to augment pattern matching with more complex
checks. They are allowed in a predefined set of constructs where pattern
matching is allowed. They are predicates, which are used to
conditionally invoke function clauses.

Not all expressions are allowed in guard clauses, but only a handful of
them. This is a deliberate choice. This way, Elixir (and Erlang) can
make sure that nothing bad happens while executing guards and no
mutations happen anywhere. It also allows the compiler to optimize the
code related to guards efficiently.

```
defmodule Factorial do
    def of(0), do: 1
    
    def of(n) when n > 0 do
        n * of(n-1)
    end
end
```


language
