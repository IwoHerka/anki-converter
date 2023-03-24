### Question
What does \`receive\` macro do?


### Answer
Checks if there\'s a message matching the given clauses exists in the
process\'s mailbox. If none such messages exist, then the process hangs
until a message arrives or the given timeout.

\

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} -> send (sender, { :ok, "Hello, #{msg}" })
    end
  end
end

# here's a child
pid = spawn(Spawn1, :greet, [])
send (pid, {self(), "World!"})

receive do
  {:ok, message} -> IO.puts message
end
```
:::

\

An optional after clause can be given in case the message was not
received\
\
after the given timeout period, specified in milliseconds

\

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
receive do
      {:selector, i, value} when is_integer(i) -> value
      value when is_atom(value) -> value
      _ -> IO.puts :stderr, "Unexpected message received"
      after 5000 -> IO.puts :stderr, "No message in 5 seconds"
end
```
:::


