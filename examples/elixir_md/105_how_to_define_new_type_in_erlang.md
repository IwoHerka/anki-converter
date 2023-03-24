### Question
How to define new type in Erlang?


### Answer
`-type NewTypeName(TVar1, TVar2, ... TVarN) :: Type.`\
\
Example:\
`-type onOff() :: on | off.-type person() :: {person, name(), age()}.-type people() :: [person()].-type name() :: {firstname, string()}.-type age() :: integer().-type dict(Key,Val) :: [{Key,Val}].`


