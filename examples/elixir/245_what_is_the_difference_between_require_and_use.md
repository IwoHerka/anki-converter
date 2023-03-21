### Question
What is the difference between require and use?


### Answer
**require** directive imports a module\'s macros into the current
namespace. **use** statement on the other hand brings an extension point
to modules.

<div>

Imagine that a couple of modules use the same dependencies, and share
commons behavior. You can leverage use to perform some sort of set up on
each of these modules.

</div>

<div>

The use macro allows you to inject **any code** in the current module.

</div>

<div>

\

</div>

<div>

Let\'s assume that we use Ecto library in our Curiosum.Authentication.\*
schemas. To provide a simple solution for common *setup* operations we
can create Curiosum.Authentication.Schema:\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule Curiosum.Authentication.Schema do                           |
|    defmacro __using__(_opts) do     quote do       use Ecto.Schema    |
|      import Ecto       import Ecto.Changeset       import Ecto.Query  |
|        def changeset(struct, params \\ %{}) do         # assuming tha |
| t changeset will perform same operations       end     end   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

In the above code, we can see \_\_using\_\_/1 macro. The whole magic
happens inside of it. Any code you put into \_\_using\_\_/1 will be
injected and executed inside of modules that use it:\

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule Curios                                                      |
| um.Authentication.Admin do   use Curiosum.Authentication.Schema  end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

Thanks to use Curiosum.Authentication.Schema, the whole code inside of
\_\_using\_\_ has been injected into Curiosum.Authentication.Admin
module.

</div>

<div>

In the background use macro is being compiled into:

</div>

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule Curiosum.Authentication.Admin do   require Curiosum.A       |
| uthentication.Schema   Curiosum.Authentication.Schema.__using__  end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>


