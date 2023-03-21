### Question
How do you raise an error when facing exceptional cases?


### Answer
Using the macro `raise/1` and if you want to specify the error type then
`raise/2`:

    iex> raise("some exception")
    ** (RuntimeError) hello

    iex> raise(ArgumentError, message: "the argument value is invalid")
    ** (ArgumentError) the argument value is invalid


