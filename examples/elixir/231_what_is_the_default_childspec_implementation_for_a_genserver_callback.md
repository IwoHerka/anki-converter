### Question
What is the default `child_spec/1` implementation for a `GenServer`
callback module?


### Answer
    def child_spec(init_arg) do
      default = %{
        id: __MODULE__,
        start: {__MODULE__, :start_link, [init_arg]}
      }
      Supervisor.child_spec(default, opts)
    end

\
where `opts` are options provided to `use GenServer`, i.e. `:id`,
`:restart` or `:shutdown`. For example:\

    use GenServer, restart: :transient, shutdown: 10_000


