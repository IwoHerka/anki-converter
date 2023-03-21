### Question
What are the different restart strategies for a Supervisor and where do
you specify it?


### Answer
In Supervisor.start\_link(child\_spec, options) as part of options. For
example,

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Supervisor.start_link( [Todo.                                         |
| ProcessRegistry, Todo.Cache, Todo.Database], strategy: :one_for_one)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\* **:one\_for\_one** restart strategy. In this mode, a supervisor
handles a process termination by starting a new process in its place,
leaving other children alone.

</div>

<div>

\* **:one\_for\_all**---When a child crashes, the supervisor terminates
all other children and then starts all children. 

</div>

<div>

<div>

<div>

<div>

<div>

\* **:rest\_for\_one**---When a child crashes, the supervisor terminates
all younger siblings of the crashed child. Then the supervisor starts
new child processes in place of the terminated ones. 

</div>

</div>

</div>

</div>

</div>


