### Question
How to receive a message? (Elixir)


### Answer
Via `receive` block, e.g.:

      receive do
        message ->
          IO.inspect(message)
        after 5000 ->
          IO.puts("message not received")
      end 


