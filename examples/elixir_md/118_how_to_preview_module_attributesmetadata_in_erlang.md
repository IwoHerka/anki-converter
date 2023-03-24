### Question
How to preview module attributes/metadata in Erlang?


### Answer
VIa `module_info()` function, e.g. `sys:module_info()`.\
\
\
5.5 module\_info/0 and module\_info/1 functions\
\
The compiler automatically inserts the two special, exported functions
into each module:\
\
Module:module\_info/0\
Module:module\_info/1\
\
These functions can be called to retrieve information about the module.\
module\_info/0\
\
The module\_info/0 function in each module, returns a list of
{Key,Value} tuples with information about the module. Currently, the
list contain tuples with the following Keys: module, attributes,
compile, exports, md5 and native. The order and number of tuples may
change without prior notice.\
module\_info/1\
\
The call module\_info(Key), where Key is an atom, returns a single piece
of information about the module.\
\
The following values are allowed for Key:\
\
module\
\
Returns an atom representing the module name.\
attributes\
\
Returns a list of {AttributeName,ValueList} tuples, where AttributeName
is the name of an attribute, and ValueList is a list of values. Notice
that a given attribute can occur more than once in the list with
different values if the attribute occurs more than once in the module.\
\
The list of attributes becomes empty if the module is stripped with the
beam\_lib(3) module (in STDLIB).\
compile\
\
Returns a list of tuples with information about how the module was
compiled. This list is empty if the module has been stripped with the
beam\_lib(3) module (in STDLIB).\
md5\
\
Returns a binary representing the MD5 checksum of the module. If the
module has native code loaded, this will be the MD5 of the native code,
not the BEAM bytecode.\
exports\
\
Returns a list of {Name,Arity} tuples with all exported functions in the
module.\
functions\
\
Returns a list of {Name,Arity} tuples with all functions in the module.\
nifs\
\
Returns a list of {Name,Arity} tuples with all NIF functions in the
module.\
native\
\
Return true if the module has native compiled code. Return false
otherwise. In a system compiled without HiPE support, the result is
always false\


