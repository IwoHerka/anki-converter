### Question
To convert a normal GenServer implementation into a Supervised server,
you needed to introduce start\_link function that takes exactly one
argument. Why is that?


### Answer
When you \'use GenServer\' it automatically injects a child\_spec/1
function that returns a default child specification. For example,

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| %{id: Todo.Cache, start: {Todo.Cache, :start_link, [nil]}}            |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

This is why when you define start\_link in your GenServer you need to
take one argument and ignore it. 

</div>

</div>

</div>

</div>


