### Question
What is `&` operator called? And what are the two uses?


### Answer
`&` can turn a function into an anonymous functions which can be passed
as arguments to other function or be bound to a variable:

    speak = &(IO.puts/1)
    speak.("hello")

Alternatively, it can be used a shorthand operator to create anonymous
functions:

    add_one = &(&1 + 1)
    add_one.(1)

which is same as `add_one = fn x -> x + 1 end`.


