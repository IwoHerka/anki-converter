### Question
Explain relation between HTTP and TCP/IP.


### Answer
HTTP is an application layer protocol. HTTP doesn't worry about the
nitty-gritty details of network communication; instead, it leaves the
details of networking to TCP/IP, the popular reliable Internet transport
protocol.\
\
TCP provides:\
• Error-free data transportation\
• In-order delivery (data will always arrive in the order in which it
was sent)\
• Unsegmented data stream (can dribble out data in any size at any
time)\
\
The Internet itself is based on TCP/IP, a popular layered set of
packet-switched net-work protocols spoken by computers and network
devices around the world. TCP/IP hides the peculiarities and foibles of
individual networks and hardware, letting com-puters and networks of any
type talk together reliably.\
\
Once a TCP connection is established, messages exchanged between the
client and server computers will never be lost, damaged, or received out
of order.\
In networking terms, the HTTP protocol is layered over TCP. HTTP uses
TCP to transport its message data. Likewise, TCP is layered over IP.


