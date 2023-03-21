### Question
Why spawning using MFA over anonymous functions?


### Answer
Spawning a function with an explicit module, function name, and argument
list (called an MFA) is the proper way to ensure that our running
processes will be correctly updated with new versions of the module code
if it is compiled while it is being used. The dynamic code upgrade
mechanism does not work with anonymous functions.


