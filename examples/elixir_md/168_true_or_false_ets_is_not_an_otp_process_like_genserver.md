### Question
True or False: ETS is not an OTP process like GenServer


### Answer
true. ETS table is a separate memory-data structure where you can store
Erlang terms. An ETS table is deeply connected to its owner process (by
default, the process that created the table). **If the owner process
terminates, the ETS table is reclaimed**.  \


