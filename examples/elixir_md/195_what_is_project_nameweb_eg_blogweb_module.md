### Question
What is `[project name]Web` (e.g. `BlogWeb`) module?


### Answer
It contains four macros: `controller`, `view`, `router` and `channel`,
which import code from Phoenix modules for convenience. They can be used
later in user\'s callback modules, for example:\
\

    defmodule BlogWeb.MyController do
      use BlogWeb, :controller
      
      ...

\
\
This will inject the following code:\
\

    use Phoenix.Controller, namespace: BlogWeb 
    import Plug.Conn 
    import BlogWeb.Gettext alias BlogWeb.Router.Helpers, as: Routes


