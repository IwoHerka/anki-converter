### Question
What's the difference between `require`, `import` and `use`?


### Answer
A module consists of functions and macros. You can use functions in other
modules using fully qualified names but not macros; you need to `require` a
module to use its macros:

```
Integer.mod(5, 3)
# => 2
Integer.is_even(42) 
# => ** (CompileError) iex:3: you must require Integer before invoking the macro Integer.is_even/1
(elixir) src/elixir_dispatch.erl:97: :elixir_dispatch.dispatch_require/6
require Integer Integer
Integer.is_even(42)
# => true
```

`use` *requires* the given module and then calls the `__using__/1` callback on
it allowing the module to inject some code into the current context. So writing
`use X` is same as writing:

```elixir
require X
X.__using__() 
```

`import` basically imports the modules namespace so you don't have to use
the fully qualified name when calling functions and macros.


language
