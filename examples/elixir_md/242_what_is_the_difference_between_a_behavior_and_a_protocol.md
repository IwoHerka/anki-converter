### Question
What is the difference between a Behavior and a Protocol?


### Answer
Protocol is a type/data based polymorphism.When I call Enum.each(foo,
\...), the concrete enumeration is determined from the type of foo. For
example, you can define Inspect(term, opts) for your custom
datastructure using defprotocol.

<div>

\

</div>

<div>

A behaviour is a way to say: give me a module as argument and I will
invoke the following callbacks on it, which these argument and so on. A
more complex example for behaviours besides a GenServer are the Ecto
adapters. When I call GenServer.start(MyModule), I explicitly pass
MyModule as a plug-in, and the generic code from GenServer will call
into this module when needed.\

</div>


