### Question
Explain `use` macro.


### Answer
<div>

The `use` macro is frequently used as an extension point. This means
that, when you `use` a module `FooBar`, you allow that module to
inject *any* code in the current module, such as importing itself or
other modules, defining new functions, setting a module state, etc.

</div>

\

<div>

For example, in order to write tests using the ExUnit framework, a
developer should use the `ExUnit.Case` module:

</div>

    defmodule AssertionTest do   use ExUnit.Case, async: true    test "always pass" do     assert true   end end

Behind the scenes, use requires the given module and then calls the
\_\_using\_\_/1 callback on it allowing the module to inject some code
into the current context. Some modules (for example, the above
ExUnit.Case, but also Supervisor and GenServer) use this mechanism to
populate your module with some basic behaviour, which your module is
intended to override or complete. Generally speaking, the following
module:

    defmodule Example do   use Feature, option: :value end

is compiled into

    defmodule Example do   require Feature   Feature.__using__(option: :value) end


