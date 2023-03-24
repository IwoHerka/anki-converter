### Question
How to calculate size of binary data in MB in Elixir?


### Answer

- Get the size of the binary data in bytes using `byte_size/1` function.
- Convert from byte size to megabytes.

```elixir
def to_megabytes(binary) do
  binary
  |> byte_size()
  |> &(&1 / 1_048_576)
end
```