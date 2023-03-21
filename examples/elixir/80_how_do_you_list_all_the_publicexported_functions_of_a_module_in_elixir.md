### Question
How do you list all the public/exported functions of a module in Elixir?


### Answer
You can use the `__info__/1` function that's automatically injected into
each Elixir module during compilation. It lists all exported functions
of a module (except `__info__/1`).

    iex> Enum.__info__(:functions)
    [
      all?: 1,
      all?: 2,
      any?: 1,
      ...
    ]


