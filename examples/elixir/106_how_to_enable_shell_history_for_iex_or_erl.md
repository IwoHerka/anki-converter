### Question
How to enable shell history for iex (or erl)?


### Answer
`iex --erl "-kernel shell_history enabled"`\
\
or via env variable:\
\
`ERL_AFLAGS="-kernel shell_history enabled"`


