### Question
What is the usage of `!` and `?` mean function names?


### Answer
-   `!` is a convention for functions which raise exceptions on failure.
    For example:

        iex> Enum.fetch([2,4,5,6], 5)
        :error
        iex> Enum.fetch!([2,4,5,6], 5)
        ** (Enum.OutOfBoundsError) out of bounds error
            (elixir) lib/enum.ex:842: Enum.fetch!/2

    \

-   `?` is a convention for functions which return a boolean value:\

        Enum.all?([1,2,3,4], fn x -> x>0 end)


