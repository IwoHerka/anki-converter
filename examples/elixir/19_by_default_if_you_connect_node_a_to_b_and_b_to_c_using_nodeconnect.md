### Question
By default, if you connect node A to B and B to C using Node.connect/1.
Node A will be connected to both B & C. How would you prevent such a
fully connected cluster?


### Answer
<div>

<div>

<div>

<div>

This can be done by assigning different cookies to all the nodes and
then, in A and C, using the *Node.set\_cookie/2* function, which allows
you to explicitly set different cookies that need to be used when
connecting to different nodes. 

</div>

</div>

</div>

</div>


