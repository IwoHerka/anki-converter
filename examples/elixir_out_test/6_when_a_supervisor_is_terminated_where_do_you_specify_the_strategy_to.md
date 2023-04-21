### Question
When a supervisor is terminated, where do you specify the strategy to
handle children processes?


### Answer
In `Supervisor.start_link(child_spec, options)` as part of the options.
For example:

    Supervisor.start_link( [Todo.ProcessRegistry, T odo.Cache, Todo.Database], strategy: :one_for_one, shutdown: 10_000)

When a supervisor process terminates, it will instruct its children to
terminate gracefully, thus giving them the chance to do final cleanup.
If some of those children are themselves supervisors, they will take
down their own trees in the same way. Graceful termination of a
GenServer worker involves invoking the `terminate/2` callback, but only
if the worker process is trapping exits. Because graceful termination
involves the possible execution of cleanup code, it may take longer than
desired. The `:shutdown` option in a child specification lets you
control how long the supervisor will wait for the child to terminate
gracefully. Possible values for `:shutdown` are:

-   time specified in milliseconds
-   `:infinity` - instructs the supervisor to wait indefinitely for the
    child to terminate
-   `:brutal_kill` - tells the supervisor to immediately terminate the
    child in a forceful way

The default value of the `:shutdown` option is 5000ms for a worker
process or `:infinity` for a supervisor process.


Supervisor