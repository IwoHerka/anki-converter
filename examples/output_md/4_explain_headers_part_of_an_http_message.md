### Question
Explain headers part of an HTTP/1.1 message.


### Answer
It consists of zero or more headers, each of which is a name, followed
by a colon (:), followed by optional whitespace, followed by a value,
followed by a CRLF. The headers are terminated by a blank line (CRLF),
marking the end of the list of headers and the beginning of the entity
body. Some versions of HTTP, such as HTTP/1.1, require certain headers
to be present for the request or response message to be valid. For
example:

    [start line]Content-type: text/plain\r\nContent-length: 199\r\n\r\n[body]


