### Question
How do you link two processes such that when one process dies, the other
process dies too?


### Answer
<div>

\`spawn\_link(anon\_fun) :: pid\`

</div>

<div>

\`spawn\_link(module\_name, :function\_name, args) :: pid\`

</div>

<div>

<div>

spawn\_link call spawns a process and links it to the caller in one
operation. When processes are linked, each can receive information when
the other exits i.e when one exits abnormally, it kills the other.

</div>

</div>


