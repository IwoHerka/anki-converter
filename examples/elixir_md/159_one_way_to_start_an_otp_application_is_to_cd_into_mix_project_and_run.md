### Question
One way to start an OTP application is to *cd* into mix project and run
*iex -S mix.* What is an another way to start the application?


### Answer
+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex                                                                   |
| > cd "/hello_world/_build/dev/lib/hello_world/ebin" /hello_world/_bui |
| ld/dev/lib/hello_world/ebin iex> Application.start(:hello_world) :ok  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

Running \'*iex -S mix*\' automatically puts the ebin directory in
BEAM\'s classpath


