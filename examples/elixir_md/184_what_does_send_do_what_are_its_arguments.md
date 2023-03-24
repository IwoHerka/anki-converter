### Question
What does `send` do? What are its arguments?


### Answer
It sends a message to the given destination:

    send(dest, message) :: message

`dest` can be one of the following:

-   remote or local PID
-   local port
-   a locally registered name (represented by an atom)
-   a tuple of the form `{registered_name, node}` for a registered name
    at another node

\
`message` can be any term.


