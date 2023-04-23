### Question

Elixir allows you to define you child spec  as part of your module if you don't
want to use the default
[`child_spec`](https://hexdocs.pm/elixir/GenServer.html) provided by
`GenServer`. For example:

```
defmodule Stack do
    use GenServer
    
    def start_link(state) do
        GenServer.start_link(__MODULE__, state, name: __MODULE__)
    end
    
    def child_spec(arg) do
        %{id: Stack, start: {Stack, :start_link, [arg]}}
    end

    ... 
end
```

How do you override this child spec when starting the supervisor?


### Answer
If you need to convert a tuple or a module child specification to a map
or modify a child specification, you can use the
[`Supervisor.child_spec/2`](https://hexdocs.pm/elixir/Supervisor.html#child_spec/2)
function. For example, to run the stack with a different `:id` and a
`:shutdown`:

```
children = [Supervisor.child_spec({Stack, [:hello]}, id: MyStack, shutdown: 10_000)]
Supervisor.start_link(children, strategy: :one_for_one)
```


supervisor genserver
