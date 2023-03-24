### Question
What is an EPMD?


### Answer
<div>

<div>

<div>

<div>

Erlang Port Mapper Daemon (EPMD), is an OS process that's started
automatically when you start the first Erlang node on the host machine.
This component acts as **a node name resolver** on the host machine.
EPMD knows the names of all currently running BEAM nodes on the machine.
When a node wants to connect to a node on this machine, it first queries
EPMD to determine which port the target node is listening on, and then
it contacts the target node. EPMD listens on port 4369, and this port
must be accessible from remote machines. 

</div>

</div>

</div>

</div>


