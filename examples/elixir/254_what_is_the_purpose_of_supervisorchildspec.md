### Question
What is the purpose of `Supervisor.child_spec/2`?


### Answer
It\'s used to convert a tuple or a module child specification to a map
or modify a child specification. For example, to run the example `Stack`
module with a different `:id` and a `:shutdown` value of 10 seconds
(10\_000 milliseconds):

    children = [
      Supervisor.child_spec({Stack, [:hello]}, id: MyStack, shutdown: 10_000)
    ]

This code will retrieve child spec from `Stack` module and modify it by
adding/changing `:id` and `:shutdown` values.


