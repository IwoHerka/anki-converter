### Question
Describe a scenario when a child\_spec/1 callback need to be implmented?


### Answer
\* When you want to run a Module as supervised

<div>

                       **and**\

<div>

\* The Supervised module is not implementing GenServer behavior(thereby
we don\'t get the automatic implementation of child\_spec/1 by
GenServer)

</div>

</div>


