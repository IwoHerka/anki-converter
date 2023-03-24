### Question
What is the difference between Application environment variable and a
Mix environment variable?


### Answer
<div>

<div>

<div>

An application environment is a **key/value store** that holds various
settings for your OTP application. A mix environment determines the
**compilation target**, such as development, test, or production. 

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
| $ MIX_ENV=test iex -S mix                                             |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> Application.get_env(:todo, :http_port)  5455                  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

First shell command, sets up the mix environment whereas the second
function call gets the application environment variable

</div>

</div>

</div>

</div>

</div>

</div>


