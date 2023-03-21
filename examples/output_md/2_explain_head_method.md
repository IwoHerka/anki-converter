### Question
Explain HEAD method


### Answer
The HEAD method behaves exactly like the GET method, but the server
returns only the headers in the response. No entity body is ever
returned. This allows a client to inspect the headers for a resource
without having to actually get the resource. Using HEAD, you can:\
\
• Find out about a resource (e.g., determine its type) without getting
it.\
• See if an object exists, by looking at the status code of the
response.\
• Test if the resource has been modified, by looking at the headers.


