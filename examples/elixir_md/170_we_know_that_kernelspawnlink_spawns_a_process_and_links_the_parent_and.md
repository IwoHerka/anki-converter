### Question
We know that Kernel.spawn\_link spawns a process and links the parent
and child. How do we connect two independent processes?


### Answer
Process.link/1 creates a link between the calling process and the given
item (process or port).

<div>

Links are bidirectional. Linked processes can be unlinked by using
unlink/1.

</div>


