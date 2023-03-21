### Question
What is a behaviour?


### Answer
In Erlang terminology, a behaviour is generic code that implements a
common pattern. The generic logic is exposed through the behaviour
module, and you can plug into it by implementing a corresponding
callback module. The callback module must satisfy a contract defined by
the behaviour, meaning it must implement and export a set of functions.
The behaviour module then calls into these functions, allowing you to
provide your own specialization of the generic code.


