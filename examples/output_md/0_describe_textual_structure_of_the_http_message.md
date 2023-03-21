### Question
Describe (textual) structure of the HTTP message.


### Answer
The request/response message consists of the following:\
\
- Request line, such as `GET /logo.gif HTTP/1.1` or Status line, such as
`HTTP/1.1 200 OK`,\
- Headers\
- An empty line\
- Optional HTTP message body data\
\
The request/status line and headers must all end with (that is, a
carriage return followed by a line feed, `\r\n`). The empty line must
consist of only and no other whitespace. For example:\

    HTTP/1.1 200 OK\r\nServer: Apache/2.2.8 (Ubuntu) mod_ssl/2.2.8\r\nLast-Modified: Sun, 26 Sep 2010 22:04:35 GMT\r\nAccept-Ranges: bytes\r\nContent-Length: 12\r\nContent-Type: text/html\r\n\r\nHello world!


