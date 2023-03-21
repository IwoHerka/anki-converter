### Question
How do you get the current node\'s name? How to assign a name when
starting BEAM?


### Answer
    iex> Node.self()
    :nonode@nohost

To start BEAM with a name, one can use `name` or `sname` option:\

    >iex --name mike@katbookpro
    Erlang/OTP 20 [erts-9.3] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

    Interactive Elixir (1.6.4) - press Ctrl+C to exit (type h() ENTER for help)
    iex(mike@katbookpro)1>


