### Question
Node.set\_cookie/2 is defined as 

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| Node.set_cookie(node \\ Node.self(), cookie)                          |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

When do you need to pass the node name?


### Answer
When you need to prevent a fully connected cluster where all nodes can
directly talk to each other. For a node **Node1** with magic cookie
**Cookie1** to be able to connect to, or accept a connection from,
another node **Node2** with a different cookie **DiffCookie**, the
function *Node.set\_cookie(Node2, DiffCookie)* must first be called at
**Node1**. This could be useful in scenario like below:

<div>

\

</div>

<div>

For example, let's say you want to connect node A to B, and B to C, but
you don't want to connect A and C. This can be done by assigning
different cookies to all the nodes and then, in A and C, using the
Node.set\_cookie/2 function, which allows you to explicitly set
different cookies that need to be used when connecting to different
nodes. 

</div>


