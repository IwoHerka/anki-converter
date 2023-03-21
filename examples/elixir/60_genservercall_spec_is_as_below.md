### Question
GenServer.call/3 spec is as below:

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| call(server_pid, request, timeout \\ 5000)                            |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

What is the timeout here implies?

</div>


### Answer
GenServer.call/3 makes a synchronous call to server\_pid and waits until
the timout (**after** *timeout* clause in **receive** loop). The default
timeout is five seconds, but you can configure it to be less for better
responsiveness or more. Note that when a request times out, it isn't
removed from the **server\_pid\'s mailbox**. A request is a message
that's placed in the server\_pid's mailbox. A timeout means you give up
waiting on the response, but the message remains in the receiver's
mailbox and will be processed at some point. 


