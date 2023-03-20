### Question
What\'s a gateway?


### Answer
Gateways are special servers that act as intermediaries for other
servers. They are often used to convert HTTP traffic to another
protocol. A gateway always receives requests as if it was the origin
server for the resource. The client may not be aware it is communicating
with a gateway.\
\
For example, an HTTP/FTP gateway receives requests for FTP URIs via HTTP
requests but fetches the documents using the FTP protocol. The resulting
document is packed into an HTTP message and sent to the client.


