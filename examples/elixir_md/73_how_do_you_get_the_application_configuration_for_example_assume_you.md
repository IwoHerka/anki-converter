### Question
How do you get the application configuration? For example, assume you
have a *:todo* app that has a *:http\_port* configured in config file.
How do you access this variable in your code?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> Application.fetch_env!(:todo, :http_port) 5454                |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

<div>

<div>

<div>

<div>

The most typical way of setting an application environment is to use the
*config/config.exs* file. You can specify various environment settings
in that file, and these settings will be loaded before the OTP
application is started. The *config.exs* file is a script that's
evaluated by the mix tool when compiling the project and starting the
application. As soon as you start the system, this setting is available
in the application environment, and you can retrieve it 

</div>

</div>

</div>

</div>


