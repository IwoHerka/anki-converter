### Question
Which type of GenServer call promotes back-pressure: call/3 or cast/2?


### Answer
<div>

<div>

<div>

<div>

Because a **call/3** blocks a client, it prevents the client from
generating too much work. The client becomes synchronized with the
server and can never produce more work than the server can handle. In
contrast, if you use **cast/2**, clients may overload the server, and
requests may pile up in the message box and consume memory. Ultimately,
you may run out of memory, and the entire VM may be terminated. 

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

<div>

Obviously, when a client needs a response, you should use calls. The
main problem with a cast is that it's a fire-and-forget kind of request,
so the caller doesn't get any guarantees. You can't be sure that the
request has reached the target, and you most certainly don't know about
its outcome. 

</div>

</div>

</div>

</div>

</div>

</div>

</div>

</div>


