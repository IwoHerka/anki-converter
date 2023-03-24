### Question
What is the default primary key in an Ecto model?


### Answer
NOTE: by using Ecto.Schema, an :id field with type :id (:id means
:integer) is generated by default, which is the primary key of the
Schema. If you want to use a different primary key, you can declare
custom \@primary\_key before the schema/2 call. Consult the Ecto.Schema
documentation for more information.

