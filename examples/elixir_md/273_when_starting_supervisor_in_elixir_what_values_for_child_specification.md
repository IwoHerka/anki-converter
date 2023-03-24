### Question
When starting supervisor in Elixir, what values for child specification
are supported?


### Answer
Overall, the child specification can be one of the following:\
\
- a map representing the child specification itself\
\
- a tuple with a module as first element and the start argument as
second - such as `{Stack, [:hello]}.` In this case,
`Stack.child_spec([:hello])` is called to retrieve the child
specification\
\
- a module - such as `Stack`. In this case, `Stack.child_spec([])` is
called to retrieve the child specification


