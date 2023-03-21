### Question
How do you start a project called **`myfirstproject`** using Mix?


### Answer
-   Change to directory where you want the project root to reside
-   `mix new myfirstproject`
-   Above mix command creates a project root called `myfirstproject` and
    the following files/sub-directories:\
    1. */mix.exs* - project configuration\
    2. */lib/* - Source code\
    3. */config/* - Application configuration\
    4. */test/* - Unit tests\
    5. *.gitignore* - Git ignore files\
    6. *.formatter* - code formatting
-   Edit *mix.exs* file to,
    1.  Edit project name etc. defined under `def project()` method
    2.  Any applications that need to be started defined under
        `def application()` method
    3.  Any dependencies defined under `def deps()` method
-   `mix deps` to list all dependencies and their status listed in
    `mix.exs`
-   `mix deps.get` to get all dependencies
-   `mix test` to run the unit tests
-   `mix compile` to compile or `mix run` to compile and run


