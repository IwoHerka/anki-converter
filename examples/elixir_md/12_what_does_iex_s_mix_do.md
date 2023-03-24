### Question
What does `iex -S mix` do?


### Answer
-   `iex -S scriptname` finds and executes the given script in PATH
-   Running `iex -S mix` tells `iex` to load the `mix` script as if I
    had just typed `mix` at the command line
-   So how does mix know to load my mix.exs file and start my
    applications and dependencies? Let's ask mix -h.\
    \
    mix - Invokes the default task (mix run) in a project
-   Therefore, `iex -S mix` is the same as running `iex -S mix run`, and
    as `mix help run` tells us, mix run starts and runs the current
    application, which it learns about by reading mix.exs.

\

Note: Why -S instead of -s? According to José, a capital S was chosen to
signify that this option behaves differently than other options. All
arguments **after -S scriptname are passed to the script**. For example,
if you want to run tests in iex with specific options, you might run
something like the following.

\

`iex -S mix test --only line:12 test/some/particular/file_test.exs`


