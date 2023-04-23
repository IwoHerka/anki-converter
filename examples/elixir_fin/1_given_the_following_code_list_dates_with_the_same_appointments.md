### Question
Given the following code, list dates with the same appointments.

```elixir
:ets.new(:todo_list, [:bag, :named_table]) # => :todo_list
:ets.insert(:todo_list, {~D[2018-05-24], "Dentist"}) # => true
:ets.insert(:todo_list, {~D[2018-05-24], "Shopping"}) # => true
:ets.insert(:todo_list, {~D[2018-05-30], "Haircut"}) # => true
:ets.insert(:todo_list, {~D[2018-05-24], "Haircut"}) # => true
```


### Answer
```elixir
:ets.match_object(:todo_list, {:_, "Haircut"})
# => [{~D[2018-05-30], "Haircut"}, {~D[2018-05-24], "Haircut"}]
```

The function [`:ets.match_object/2`](https://www.erlang.org/doc/man/ets.html#match_object-2)
accepts a match pattern - a tuple that describes the shape of the row. The atom
`:_` indicates that you accept any value, so the pattern `{:_, "Dentist"}`
essentially matches all rows where the second element is `"Dentist"`.


ets erlang
