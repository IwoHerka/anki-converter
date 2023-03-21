### Question
Difference between throw, exit and error?


### Answer
There are 3 classes which can be caught with a try \... catch: throw,
error and exit.\
\
throw is generated using throw/1 and is intended to be used for
non-local returns and does not generate an error unless it is not caught
(when you get a nocatch error).\
\
error is generated when the system detects an error. You can explicitly
generate an error using error/1. The system also includes a stacktrace
in the generated error value, for example {badarg,\[\...\]}.\
\
exit is generated using exit/1 and is intended to signal that this
process is to die.


