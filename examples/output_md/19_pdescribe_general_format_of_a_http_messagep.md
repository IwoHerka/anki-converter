### Question
Describe general format of a HTTP message.


### Answer
HTTP messages consist of three parts:\
\
**Start line**\
The first line of the message is the start line, indicating what to do
for a request or what happened for a response.\
\
**Header fields**\
Zero or more header fields follow the start line. Each header field
consists of a name and a value, separated by a colon (:) for easy
parsing. The headers end with a blank line. Adding a header field is as
easy as adding another line.\
\
**Body**\
After the blank line is an optional message body containing any kind of
data. Request bodies carry data to the web server; response bodies carry
data back to the client. Unlike the start lines and headers, which are
textual and structured, the body can contain arbitrary binary data
(e.g., images, videos, audio tracks, software applications). Of course,
the body can also contain text.\
\
![](16683744372867170529993559701274.jpg)


