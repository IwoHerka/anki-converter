### Question
Let\'s assume the following long running query that need be run
concurrently. 

<div>

\

</div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)>run_que                                                        |
| ry = fn query_def -> Process.sleep(2000) "#{query_def} result" end    |
| iex(2)> Enum.map(1..5, &run_query.(&1))                               |
|         ["1 result", "2 result", "3 result", "4 result", "5 result"]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

How do you Task module to run it concurrently?\

</div>

</div>


### Answer
<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(                                                                  |
| 1)> tasks=Enum.map(1..5, &Task.async(fn -> run_query.("query #{&1}")  |
| end)) iex(2)> Enum.map(tasks, &Task.await(&1)) ["query 1 result", "qu |
| ery 2 result", "query 3 result", "query 4 result", "query 5 result"]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

Here you create five queries, and then start each query execution in a
separate task. The result in the tasks variable is a list of five
%Task{} structs, each describing one task executing a query.

</div>

<div>

To wait for all the results, you pass each task from the tasks variable
to the Task .await/1 function 

</div>

</div>

</div>

</div>

</div>

</div>

</div>


