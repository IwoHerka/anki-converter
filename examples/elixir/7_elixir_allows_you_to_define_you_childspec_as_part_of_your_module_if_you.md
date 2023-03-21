### Question
<div>

Elixir allows you to define you child\_spec as part of your module if
you don\'t want to use the default child\_spec provided by \'use
GenServer\' like below: \

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule Stac                                                        |
| k do   use GenServer    def start_link(state) do     GenServer.start_ |
| link(__MODULE__, state, name: __MODULE__)   end      def child_spec(a |
| rg) do    %{      id: Stack,      start: {Stack, :start_link, [arg]}  |
|     }   end    ## Callbacks    @impl true   def init(stack) do     {: |
| ok, stack}   end    @impl true   def handle_call(:pop, _from, [head | |
|  tail]) do     {:reply, head, tail}   end    @impl true   def handle_ |
| cast({:push, head}, tail) do     {:noreply, [head | tail]}   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

How do you override this child spec when starting the supervisor?

</div>

<div>

<div>

<div>

</div>

</div>

</div>


### Answer
<div>

<div>

<div>

<div>

If you need to convert a tuple or a module child specification to a map
or modify a child specification, you can use the
Supervisor.child\_spec/2 function. For example, to run the stack with a
different :id and a :shutdown value of 10 seconds (10\_000
milliseconds):

</div>

<div>

\

</div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| child                                                                 |
| ren = [ Supervisor.child_spec({Stack, [:hello]}, id: MyStack, shutdow |
| n: 10_000) ] Supervisor.start_link(children, strategy: :one_for_one]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>


