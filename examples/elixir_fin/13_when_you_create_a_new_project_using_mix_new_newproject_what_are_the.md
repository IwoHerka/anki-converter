### Question
When you create a new project using `mix new hello_world` what are the
artifacts created?


### Answer
The following file structure is generated:

```
hello_world/
  ├── .formatter.exs
  ├── .gitignore
  ├── config/
  │   └── config.exs
  ├── lib/
  │   └── hello_world.ex
  ├── mix.exs
  ├── README.md
  └── test/
      ├── hello_world_test.exs
      └── test_helper.exs
```

Here's a brief overview of the generated files and directories:

- `.formatter.exs` - This file contains the configuration for the Elixir code
  formatter, which helps maintain a consistent code style across the project.

- `.gitignore` - This file lists files and directories that should be ignored by
the Git version control system.

- `config/` This directory contains the configuration files for your application.
The config.exs file is the main configuration file and can be used to define
global or environment-specific configurations.

- `lib/` - This directory contains the Elixir source code files for your
application. In this case, it contains the main module file `hello_world.ex`.

- `mix.exs` - This is the project configuration file. It defines your project's
dependencies, compilation options, and other project-related settings.

- `README.md` - This is a Markdown file containing documentation or instructions for
your project.

- `test/` - This directory contains the test files for your application. The
`test_helper.exs` file sets up the testing environment, and the
`hello_world_test.exs` file contains an example test for the `HelloWorld` module.


mix
