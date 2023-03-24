### Question
How to stop process from GenServer callbacks?


### Answer
Return `{:stop, reason}` or `:ignore` from `init/1` or
`{:stop, reason, new_state` from `handle_` callbacks.


