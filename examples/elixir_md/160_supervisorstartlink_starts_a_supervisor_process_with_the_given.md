### Question
Supervisor.start\_link/2 starts a Supervisor process with the given
children. What are the two arguments passed to the start\_link function?


### Answer
Children and a list of options.

<div>

\

</div>

<div>

The children argument is either 

</div>

<div>

 \* two-element tuples with {module\_name, arg}. In this case,
Supervisor will first invoke module\_name.child\_ spec(arg) to get the
actual specification. This function must return the specification map.
The supervisor then proceeds to start the child according to the
specification. 

</div>

<div>

 \* or a map with the child specification. here's what the specification
for the to-do cache looked like:\

</div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| %{                                                                    |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|                                                                       |
|     id: Todo.Cache,       start: {Todo.Cache, :start_link, [nil]}, }  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

A strategy is required to be provided through the :strategy option. \

</div>

</div>

</div>

</div>


