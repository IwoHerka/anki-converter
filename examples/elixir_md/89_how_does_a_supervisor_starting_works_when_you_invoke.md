### Question
How does a supervisor starting works, when you invoke
Supervisor.start\_link(child\_specs, options)?


### Answer
<div>

<div>

<div>

<div>

1\. The new process is started, powered by the Supervisor module.

</div>

<div>

2\. The supervisor process goes through the list of child specifications
and starts each child, one by one.

</div>

<div>

3\. Each specification is resolved, if needed, by invoking child\_spec/1
from the cor- responding module.

</div>

<div>

4\. The supervisor starts the child process, according to the :start
field of the child specification. 

</div>

</div>

</div>

</div>


