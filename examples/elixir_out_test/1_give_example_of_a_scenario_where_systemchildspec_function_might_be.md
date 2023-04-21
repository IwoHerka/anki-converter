### Question
Give example of a scenario where `System.child_spec/2` function might be
useful:

> `Supervisor.child_spec/2` is a function for explicitly building and
> overriding child specification.
>
> Similar to `start_link/2` and `init/2`, it expects a module,
> `{module, arg}`, or a child specification map. If a two-element tuple
> in the shape of `{module, arg}` is given, the child specification is
> retrieved by calling `module.child_spec(arg)`. If a module is given,
> the child specification is retrieved by calling
> `module.child_spec([])`.
>
> After the child specification is retrieved, the fields on overrides
> are directly applied on the child spec. If overrides has keys that do
> not map to any child specification field, an error is raised.

### Answer

Scenario where a supervisor needs to start multiple processes with the
same default child specs (e.g. multiple identical GenServer workers).
For example:

::: {#cb1 .sourceCode}
``` {.sourceCode .elixir}
def start_link(_) do     File.mkdir_p!(@db_folder)     children = Enum.map(1..@pool_size, &worker_spec/1)     Supervisor.start_link(children, strategy: :one_for_one) end  @doc "Override worker ID in default worker child spec" defp worker_spec(worker_id) do     default_worker_spec = {Todo.DatabaseWorker, {@db_folder, worker_id}}     Supervisor.child_spec(default_worker_spec, id: worker_id) end
```
:::

In the above example we want to create multiple copies of a GenServer
worker, each with the same default spec. By mapping them over
`Supervisor.child_spec`, we can parametrize each spec in `worker_spec/1`
function.


### Answer
supervisor genserver


