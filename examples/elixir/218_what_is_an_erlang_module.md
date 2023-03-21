### Question
What is an Erlang module?


### Answer
Modules are containers for code. They guard access to functions by
either making them private or exporting them for public use. There can
be only one module per object file (.beam file). If a module is named
test, it must reside in a source file called test.erl and be compiled to
an object file called test.beam. A module consists of a sequence of
attributes and function declarations, each terminated by period (.).


