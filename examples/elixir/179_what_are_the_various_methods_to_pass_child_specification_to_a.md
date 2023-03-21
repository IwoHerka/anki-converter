### Question
What are the various methods to pass child specification to a
Supervisor?


### Answer
1\. Pass a List of modules for the child processes to be started. For
example,

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Superv                                                                |
| isor.start_link([Todo.Cache, Todo.Database], strategy: :one_for_one)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

Supervisor.start\_link/2 starts a supervisor process and links it to the
caller.

</div>

<div>

The first argument is the list of desired children. More precisely, each
element of this list is a **child specification** that describes how the
child should be started and managed. When the supervisor process is
started, it will go through this list and start each child according to
the specification. In this example, the supervisor will invoke
Todo.Cache.child\_spec(\[\]). In this case, since Todo.Cache is a
GenServer is has a defult implementation of child\_spec/1 

</div>

<div>

\

</div>

<div>

2\. Pass tuple {module\_name, arg} in the child specification list.
Supervisor will first invoke **module\_name.child\_ spec(arg)** to get
the actual specification. This function must return the specification
map. The supervisor then proceeds to start the child according to the
specification. \

</div>

<div>

\

</div>

<div>

3\. Pass a child specification map to Supervisor.start\_link/2. For
example,

</div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Supervisor.start_link( [ %{      id: Todo.Cache,      start: {        |
| Todo.Cache, :start_link, [nil] }    }   ],   strategy: :one_for_one)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

</div>

</div>

</div>


