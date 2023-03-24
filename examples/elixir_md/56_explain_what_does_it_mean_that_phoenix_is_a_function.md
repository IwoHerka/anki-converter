### Question
Explain what does it mean that Phoenix is a function?


### Answer
When a user makes a request, a connection is established.\
In Phoenix, that connection is the whole universe of things we need to
know about a user's request. It is a struct, which is a map with a known
set of fields. The connection comes in with information about the
request: whether it's HTTP or HTTPS, what the URL is, what the
parameters look like. Then, each layer of Phoenix (Phenix
function-pipiline) makes a little change to that connection. When
Phoenix is done, that connection will have the response in it.\
\
`connection |> phoenix `


