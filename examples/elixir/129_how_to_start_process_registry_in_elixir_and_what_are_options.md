### Question
How to start process registry in Elixir and what are options?


### Answer
`Registry.start_link(name: :my_registry, keys: :unique)`\
\
The single argument is a keyword list of registry options. The mandatory
options are :name and :keys.\
\
The :name option is an atom, and it specif i es the name of the registry
process. You'll use this name to interact with the registry.\
The :keys option can either be :unique or :duplicate. In a unique
registry, names are unique---only one process can be registered under
any key. This is useful when you want to assign a unique role to
processes. For example, in your system, only one process could be
associated with {:database\_worker, 1}. In contrast, in a duplicate
registry, multiple processes can have the same name. Duplicate registry
is useful in scenarios where a single publisher process needs to send
notif i cations to a dynamic number of subscriber processes, which tend
to come and go over time.


