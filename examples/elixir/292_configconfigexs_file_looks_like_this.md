### Question
config/config.exs file looks like this:

<div>

\

</div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| use Mix.Confi                                                         |
| g config :todo, http_port: 5454 ... import_config "#{Mix.env()}.exs"  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

What does the *import\_config* macro do?

</div>

</div>

</div>

</div>


### Answer
<div>

<div>

<div>

The expression import\_config \"*\#{Mix.env()}.exs*\" imports the
configuration specific to the current mix environment. To do that, you
use the *Mix.env/0* function, which returns the mix environment as an
atom (:dev, :test, or :prod). For example,

</div>

<div>

\

</div>

<div>

In config/test.exs,

</div>

<div>

\

</div>

<div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| use Mix.Config config :todo, http_port: 5455                          |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

Let's quickly verify if this works. Start the application in the default
dev environment:

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| $ iex -S mix iex(1)> Application.get_env(:todo, :http_port) 5454      |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

<div>

Now, try the same in the test environment:

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| $ MIX_ENV                                                             |
| =test iex -S mix iex(1)> Application.get_env(:todo, :http_port) 5455  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

</div>

</div>

</div>


