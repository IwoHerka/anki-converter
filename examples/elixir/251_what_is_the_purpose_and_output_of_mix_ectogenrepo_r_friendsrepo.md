### Question
What is the purpose and output of `mix ecto.gen.repo -r Friends.Repo`?


### Answer
This command will generate the configuration required to connect to a
database. The first bit of configuration is in `config/config.exs`:

    config :friends, Friends.Repo,
      database: "friends",
      username: "user",
      password: "pass",
      hostname: "localhost"

This configures how Ecto will connect to our database, called
\"friends\". Specifically, it configures a \"repo\". The
`Friends.Repo` module is defined in `lib/friends/repo.ex` by
our `mix ecto.gen.repo` command:

    defmodule Friends.Repo do
      use Ecto.Repo,
        otp_app: :friends,
        adapter: Ecto.Adapters.Postgres
    end

\
\
\


