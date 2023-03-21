### Question
Imagine a usecase where you want to create a cluster of distributed
processes and replicate data in those processes for fault tolerance.
When you want to update data, you write to all processes for example,
GenServer.multi\_call/4. But for reading you can pick a random process
form the cluster. What OTP mechanism would you choose?  


### Answer
1\. Create a process group using :pg2 

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node2@localhost)1> :pg2.start {:ok, #PID                          |
| <0.112.0>} iex(node2@localhost)2> :pg2.create({:todo_list, "bob"}) :o |
| k iex(node2@localhost)3> :pg2.join({:todo_list, "bob"}, self())  :ok  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

2\. Add each process in this process group

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node1@localhost)1> Node.connect(:"node2@localhost") true iex      |
| (node1@localhost)2> :pg2.which_groups                [todo_list: "bob |
| "] iex(node1@localhost)3> :pg2.join({:todo_list, "bob"}, self()) :ok  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

3\. Query all processes and send data updates to all processes

</div>

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node2@localhost)4> :pg2.                                          |
| get_members({:todo_list, "bob"})  [#PID<11151.110.0>, #PID<0.110.0>]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

4\. Pick the local process or a random process for data reads\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node2@                                                            |
| localhost)5> :pg2.get_closest_pid({:todo_list, "bob"}) #PID<0.110.0>  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


