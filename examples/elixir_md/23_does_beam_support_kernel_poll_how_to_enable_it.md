### Question
Does BEAM support kernel poll? How to enable it?


### Answer
Yes, if the OS supports it, Erlang will rely on a kernel poll such as
epoll or kqueue, which takes advantage of the OS kernel for nonblocking
I/O. You can request the use of a kernel poll by providing the `+K true`
Erlang flag when you start the BEAM.


