### Question
Assume that you want a node to be running between ports 10\_000 and
10\_100. How would you configure it?


### Answer
<div>

<div>

<div>

This can be done by setting the *inet\_dist\_listen\_min* and
*inet\_dist\_listen\_max* environment variables of the kernel app at the
command line:

</div>

</div>

</div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| $ iex \                                                               |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  --erl '-kernel inet_dist_listen_min 10000' \                         |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| --erl '-kernel inet_dist_listen_max 10100' \                          |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|  --sname node1@localhost                                              |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

The node will listen on the first port available in the given range. If
you're sure there won't be a port clash, you can use the same value for
both parameters, thus effectively designating a single port to be used.

</div>

<div>

You can manually inspect the ports of all nodes on the host machine via
:net\_adm .names/0:

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(node1@localhost)1> :net_adm.names()  {:ok, [{'node1', 10000}]}    |
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

</div>


