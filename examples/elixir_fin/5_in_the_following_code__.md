### Question
In the following code, why is the ETS table wrapped in `GenServer`?
Why there's no callback code for `get` and `put`?

```
defmodule ETSKeyValue do
    use GenServer
    
    def start_link() do
        GenServer.start_link(__MODULE__, nil, name: __MODULE__)
    end
    
    def init(_) do
        :ets.new(__MODULE__, [:named_table, :public, write_concurrency: true])
        {:ok, nil}
    end
    
    def put(key, value) do
        :ets.insert(__MODULE__, {key, value})
    end
    
    def get(key) do
        case :ets.lookup(__MODULE__, key) do
            [{^key,value}] -> value
            [] -> nil
        end
    end
end
```


### Answer
1. An ETS table is deeply connected to its owner process (by default,
the process that created the table). If the owner process terminates,
the ETS table is reclaimed. So the sole purpose of this GenServer
process is to keep the table alive.

2. Get and put operations now don't go through the server process. This
means that multiple clients can work with the key/value store
simultaneously, without blocking each other.


ets genserver
