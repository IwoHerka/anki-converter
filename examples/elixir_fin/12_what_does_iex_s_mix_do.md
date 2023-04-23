### Question
What does `iex -S mix` do?


### Answer
`iex -S <scriptname>` is used to start the IEx session and execute the script in
its context. Running `iex -S mix` tells `iex` to execute `mix` command, which is a
shorthand for `mix run`, which runs the Mix project in current directory.

According to José, a capital `-S` (in contrast to standard `-s`) is used to
signify that this option behaves differently than other options. All arguments
**after `-S <scriptname>` are passed to the script**. For example, if you want
to run tests in iex with specific options, you might run something like the
following:

```
iex -S mix test --only line:12 test/some/particular/file_test.exs
```


iex mix
