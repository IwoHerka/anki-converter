### Question
What is *m:n* threading?


### Answer
In *m:n* threading, *n* OS threads execute *m* microthreads (Erlang
processes). In other words, BEAM maps some *n* number of OS threads onto
some *m* number of BEAM processes.


