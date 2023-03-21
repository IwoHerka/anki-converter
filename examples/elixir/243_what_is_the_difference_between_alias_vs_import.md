### Question
What is the difference between alias vs import?


### Answer
<div>

**Aliases** are great for **shortening module names** but **import**
helps when we use functions from a given module extensively and want to
**skip using module name** part.

</div>

<div>

\

</div>

<div>

**alias**

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule MyModule do  alias Curiosum.Authenticatio                   |
| n.Admin  def function do     Admin.changeset(admin, params)  end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

\

</div>

<div>

**import**

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule M                                                           |
| yModule do  alias Curiosum.Authentication.Admin  import Admin, only:  |
| [changeset: 2]  def function do    changeset(admin, params)  end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

\

</div>

<div>

\

</div>

<div>

\

</div>

<div>

\

</div>

<div>

\

</div>


