### Question
Explain the purpose and usage of `Config` module.


### Answer
`Config` provides a simple keyword-based configuration API. This module
is most commonly used to define application configuration, typically in
`config/config.exs`:\

    import Config

    config :some_app,
      key1: "value1",
      key2: "value2"

    import_config "#{config_env()}.exs"

`import Config` will import the functions `config/2`, `config/3`,
`config_env/0`, `config_target/0`, and `import_config/1` to help you
manage your configuration.\
\
`config/2` and `config/3` are used to define key-value configuration for
a given application. Once Mix starts, it will automatically evaluate the
configuration file and persist the configuration above into
`:some_app`\'s application environment, which can be accessed in as
follows:\

    "value1" = Application.fetch_env!(:some_app, :key1)

Finally, the line `import_config "#{config_env()}.exs"` will import
other config files based on the current configuration environment, such
as `config/dev.exs` and `config/test.exs`.


