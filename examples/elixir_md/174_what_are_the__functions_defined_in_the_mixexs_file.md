### Question
What are the 3 functions defined in the Mix.exs file?


### Answer
-   `project/0` - Defines the project including name, version, Elixir
    version, etc.
-   `application/0` - Here you specify some options that will eventually
    make it to the application resource file. In this case, the
    description includes the list of other Erlang and Elixir
    applications you depend on, together with the module that will be
    used to start the application. By default, Elixir's `:logger`
    application is listed.
-   `deps/0`\
    Defines the list of third-party dependencies --- other libraries you
    want to use in your project.


