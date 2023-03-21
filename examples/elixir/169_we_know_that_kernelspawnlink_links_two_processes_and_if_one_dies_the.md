### Question
We know that Kernel.spawn\_link links two processes and if one dies the
other will be terminated as well. What is the function call to prevent
the second process form killed?


### Answer
<div>

<div>

<div>

This can be done by trapping exits. When a process is trapping exits, it
isn't taken down when a linked process crashes. Instead, an exit signal
is placed in the surviving process's message queue, in the form of a
standard message. A trapping process can receive these messages and do
something about the crash.

</div>

<div>

To set up an exit trap, you call Process.flag(:trap\_exit, true), which
makes the current process trap exit signals.

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> spawn                                                         |
| (fn -> Process.flag(:trap_exit, true)                                 |
|  spawn_link(fn -> raise("Something went wrong") end)                  |
|                 receive do                                    msg ->  |
| IO.inspect(msg)                                 end             end)  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

<div>

<div>

</div>

<div>

<div>

<div>

<div>

<div>

Here you make the parent process trap exits and then spawn a linked
process that will crash. Then you receive a message and print it to the
screen. The shell session produces the following output:

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| {                                                                     |
| :EXIT, #PID<0.93.0>,  {%RuntimeError{message: "Something went wrong"} |
| ,   [{:erl_eval, :do_apply, 6, [file: 'erl_eval.erl', line: 668]}]}}  |
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

</div>

</div>

</div>

</div>

</div>


