### Question
Difference between **require**,**import**,**use**?


### Answer
-   A module consists of functions and macros. You can use functions in
    other modules using fully qualified names but not macros;you need to
    **require** a module to use its macros:

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
iex()> Integer.mod(5, 3) # mod is a function 2 iex()> Integer.is_even(42) ** (CompileError) iex:3: you must require Integer before invoking the macro Integer.is_even/1     (elixir) src/elixir_dispatch.erl:97: :elixir_dispatch.dispatch_require/6 iex()> require Integer Integer iex()> Integer.is_even(42) # is_even is a macro true 
```
:::

-   **use** *requires* the given module and then calls the **using**/1
    callback on it allowing the module to inject some code into the
    current context. So writing use X is same as writing

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
require X X.__using__() 
```
:::

-   **import** basically imports the modules namespace so you don\'t
    have to use the fully qualified name when calling functions AND
    macros


