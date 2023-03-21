### Question
What is the use of `&(...)` syntax?


### Answer
`&(...)` is a shortcut for creating anonymous functions. Inside that
expression, the placeholders `&1`, `&2` and so on correspond to the
first, second and subsequent parameters of the function. For example:

    &((&1 + &3) * &2)

\


