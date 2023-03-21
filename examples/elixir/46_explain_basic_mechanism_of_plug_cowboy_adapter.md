### Question
Explain basic mechanism of Plug Cowboy adapter.


### Answer
Adapter generaters Cowboy configuration (by default all requests are
piped to one default handler), starts the server and calls the plug to
process the request and send the response. The first pipe is the router
which then takes over. At the end, in most cases adapter just calls
`:cowboy_req.reply`.


