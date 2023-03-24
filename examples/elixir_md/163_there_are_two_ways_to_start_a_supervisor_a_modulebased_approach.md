### Question
There are two ways to start a supervisor, a module-based approach
(*start\_link(module, init\_arg, options \\\\ \[\])*) where you
implement the Supervisor bevahior in the module and a function based
approach where you call, *Supervisor.start\_link(children, options)*
passing the children. What is the difference?


### Answer
This is the function based approach:

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| children = [    %{         id: Stack,         start: {                |
| Stack, :start_link, [[:hello]]} }  ]  {:ok, pid} = Supervisor.start_l |
| ink(children, strategy: :one_for_one) Supervisor.count_children(pid)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

And this is the Module-based approach:

</div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule MyApp.Supervisor do   # Automatically defines child_sp      |
| ec/1   use Supervisor    def start_link(init_arg) do     Supervisor.s |
| tart_link(__MODULE__, init_arg, name: __MODULE__)   end    @impl true |
|    def init(_init_arg) do     children = [       {Stack, [:hello]}    |
|   ]      Supervisor.init(children, strategy: :one_for_one)   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

</div>

<div>

<div>

The difference between the two approaches is that a module-based
supervisor gives you more direct control over how the supervisor is
initialized. Instead of calling *Supervisor.start\_link/2* with a list
of children that are automatically initialized, we manually initialized
the children by calling *Supervisor.init/2* inside its *init/1*
callback.

</div>

<div>

*use Supervisor* also defines a *child\_spec/1* function which allows us
to run *MyApp.Supervisor* **as a child of another supervisor** or at the
top of your supervision tree as:

</div>

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| children = [   MyApp.                                                 |
| Supervisor ] Supervisor.start_link(children, strategy: :one_for_one)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

A general guideline is to use the supervisor without a callback module
**only at the top of your supervision tree**, generally in the
*Application.start/2* callback. We recommend using module-based
supervisors for any other supervisor in your application, so they can
run as a child of another supervisor in the tree.\

</div>

</div>


