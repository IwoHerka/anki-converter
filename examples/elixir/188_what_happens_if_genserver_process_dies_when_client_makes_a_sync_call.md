### Question
What happens if GenServer process dies when client makes a sync call?


### Answer
When you issue a synchronous request via `GenServer.call`, if a server
process crashes, an exit signal will occur in your client process. This
is a simple but very important example of cross-process error
propagation. Internally, GenServer sets up a temporary monitor that
targets the server process. While waiting for a response from the
server, if a `:DOWN` message is received, GenServer can detect that a
process has crashed and raise a corresponding exit signal in the client
process.


