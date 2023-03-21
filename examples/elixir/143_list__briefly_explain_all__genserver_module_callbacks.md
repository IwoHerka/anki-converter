### Question
List & briefly explain all (8) `GenServer` module callbacks.


### Answer
-   `init(init_arg)` - Invoked when the server is started.
    `start_link/3` or `start/3` will block until it returns.
-   `handle_call(request, from, state)` - Invoked to handle synchronous
    `call/3` messages. `call/3` will block until a reply is received
    (unless the call times out or nodes are disconnected).
-   `handle_cast(request, state)` - Invoked to handle asynchronous
    `cast/2` messages.
-   `handle_continue(continue_arg, state)` - Invoked to handle continue
    instructions.
-   `handle_info(msg, state)` - Invoked to handle all other messages.
-   `terminate(reason, state)` - Invoked when the server is about to
    exit. It should do any cleanup required.
-   `code_change(old_vsn, state, extra)` - Invoked to change the state
    of the `GenServer` when a different version of a module is loaded
    (hot code swapping) and the state\'s term structure should be
    changed.
-   `format_status(reason, pdict_and_state)` - Invoked in some cases to
    retrieve a formatted version of the `GenServer` status.


