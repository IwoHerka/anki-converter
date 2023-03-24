### Question
List and briefly explain `cowboy` functions to start and stop the
server.


### Answer
To start the server, one can use `cowboy:start_clear` (for plain TCP)
and `cowboy:start_tls` (for connections using TLS). Both functions
accept name for the server, as well options for transport (Ranch
options) and protocol (such as `[{port, 8080}]`). Server can be stopped
using `cowboy:stop_listener`.


