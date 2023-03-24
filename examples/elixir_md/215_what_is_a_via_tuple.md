### Question
What is a via tuple?


### Answer
<div>

<div>

<div>

A via tuple is a mechanism that allows you to use an arbitrary
third-party registry to register OTP-compliant processes, such as
GenServer and supervisor. Recall that you can provide a :name option
when starting a GenServer: 

</div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| GenServer.start_link(callback_module, some_arg, name: some_name)      |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

<div>

Instead of passing only atoms as the :name option, which caused the
started process to be registered locally, the :name option can also be
provided in the shape of **{:via, some\_module, some\_arg}**. Such a
tuple is also called a via tuple. \

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

<div>

If you provide a **via tuple as the name** option, GenServer will invoke
a well-defined function from some\_module to register the process.
Likewise, you can pass a **via tuple as the first argument** to
GenServer.cast and GenServer.call, and GenServer will discover the pid
using some\_module. In this sense, some\_module acts like a custom
third-party process registry, and the via tuple is the way of connecting
such a registry with GenServer and similar OTP abstractions. 

</div>

</div>

</div>

</div>

</div>

</div>

</div>


