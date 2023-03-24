### Question
How to start/configure Phoenix in a regular OTP app?


### Answer
Phoenix is started by adding `Endpoint` callback module to app\'s
supervisor. For example:\
\

    children = [BlogWeb.Endpoint] 
    opts = [strategy: :one_for_one, name: Blog.Supervisor] 
    Supervisor.start_link(children, opts)


