### Question
As a library author why is it a bad idea to use Application
environment(config/config.exs) for configuration?


### Answer
<div>

<div>

<div>

Scripts such as config.exs, or environment-specific ones like dev.exs,
are evaluated before the project is compiled and started. This means
you're limited in what you can do in such scripts. On top of that, the
application environment is **global** which means it becomes impossible
for two dependencies to use your library in two different ways.

</div>

<div>

\

</div>

<div>

Let\'s see a simple example. Imagine that you implement a library that
breaks a string in two parts based on the first occurrence of the dash
\"-\" character:\

</div>

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule DashSplitter do   def split(string) when is                 |
| _binary(string) do     String.split(string, "-", parts: 2)   end end  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

Now imagine someone wants to split the string in three parts. You decide
to make the number of parts configurable via the application
environment:\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| defmodule DashSplitter do                                             |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
|   def split(strin                                                     |
| g) when is_binary(string) do     parts = Application.get_env(:dash_sp |
| litter, :parts, 2)     String.split(string, "-", parts: parts)   end  |
| ```                                                                   |
|                                                                       |
| ``` {style="line-height: 125%"}                                       |
| end                                                                   |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

Now users can configure your library in their config/config.exs file as
follows:

</div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| config :dash_splitter, :parts, 3                                      |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

Once your library is configured, it will **change the behaviour of all
users of your library.** If a library was expecting it to split the
string in 2 parts, since the configuration is global, it will now split
it in 3 parts.

</div>

<div>

The solution is to provide configuration as close as possible to where
it is used and not via the application environment. 

</div>

</div>

</div>

</div>


