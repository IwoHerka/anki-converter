### Question
Explain four main Ecto\'s components.


### Answer
Ecto is split into 4 main components:\
\
Ecto.Repo - repositories are wrappers around the data store. Via the
repository, we can create, update, destroy and query existing entries. A
repository needs an adapter and credentials to communicate to the
database\
\
Ecto.Schema - schemas are used to map external data into Elixir structs.
We often use them to map database tables to Elixir data but they have
many other use cases\
\
Ecto.Query - written in Elixir syntax, queries are used to retrieve
information from a given repository. Ecto queries are secure and
composable\
\
Ecto.Changeset - changesets provide a way for track and validate changes
before they are applied to the data\
\
In summary:\
\
Ecto.Repo - where the data is\
Ecto.Schema - what the data is\
Ecto.Query - how to read the data\
Ecto.Changeset - how to change the data


