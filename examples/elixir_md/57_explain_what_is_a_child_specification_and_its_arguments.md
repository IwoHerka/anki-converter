### Question
Explain what is a child specification and its arguments.


### Answer
The child specification describes how the supervisor starts, shuts down,
and restarts child processes. The child specification is a map
containing up to 6 elements. The first two keys in the following list
are required, and the remaining ones are optional:\
\
`:id` - any term used to identify the child specification internally by
the supervisor; defaults to the given module. In the case of conflicting
:id values, the supervisor will refuse to initialize and require
explicit IDs. This key is required.\
\
`:start` - a tuple with the module-function-args to be invoked to start
the child process. This key is required.\
\
`:restart` - an atom that defines when a terminated child process should
be restarted (see the \"Restart values\" section below). This key is
optional and defaults to :permanent.\
\
`:shutdown` - an integer or atom that defines how a child process should
be terminated (see the \"Shutdown values\" section below). This key is
optional and defaults to 5\_000 if the type is :worker or :infinity if
the type is :supervisor.\
\
`:type` - specifies that the child process is a :worker or a
:supervisor. This key is optional and defaults to :worker.


