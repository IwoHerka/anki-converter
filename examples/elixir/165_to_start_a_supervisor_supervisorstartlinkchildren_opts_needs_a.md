### Question
To start a supervisor, Supervisor.start\_link(children, opts) needs a
predefined list of children. How do you create supervisor for children
that dynamic i.e not known at the startup time?


### Answer
<div>

<div>

<div>

<div>

For such cases, you need a **DynamicSupervisor.start\_link(opts)** that
can start children on demand.When you start a dynamic supervisor, you
don't provide a list of child specifications, so only the supervisor
process is started. Then, whenever you want to, you can start a
supervised child using DynamicSupervisor.start\_child/2. 

</div>

</div>

</div>

</div>


