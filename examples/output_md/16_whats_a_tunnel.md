### Question
What\'s a tunnel?


### Answer
Tunnels are HTTP applications that, after setup, blindly relay raw data
between two connections. HTTP tunnels are often used to transport
non-HTTP data over one or more HTTP connections, without looking at the
data.\
\
One popular use of HTTP tunnels is to carry encrypted Secure Sockets
Layer (SSL) traffic through an HTTP connection, allowing SSL traffic
through corporate fire-walls that permit only web traffic. An HTTP/SSL
tunnel receives an HTTP request to establish an outgoing connection to a
destination address and port, then proceeds to tunnel the encrypted SSL
traffic over the HTTP channel so that it can be blindly relayed to the
destination server.


