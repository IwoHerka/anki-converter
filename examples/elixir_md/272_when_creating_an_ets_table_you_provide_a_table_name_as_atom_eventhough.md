### Question
When creating an ETS table you provide a table name as atom eventhough
you still need to use the reference for table access like below:

<div>

\

</div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(2)> table=:ets.new(:my_table, [                                   |
| ]) #Reference<0.4030288514.1534984196.194401> iex(3)> :ets.insert(tab |
| le, {:key_1,1}) true iex(4)> :ets.insert(table, {:key_2,%{name: "mike |
| ", city: "boston" }}) true iex(5)> :ets.lookup(table, :key_2)         |
|                             [key_2: %{city: "boston", name: "mike"}]  |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

What\'s the purpose of :my\_table?

</div>


### Answer
<div>

<div>

<div>

<div>

This argument must be an atom, and by default it serves no purpose but
it\'s still required. You can create multiple tables with the same name,
and they're still different tables.

</div>

<div>

But if you provide a **:named\_table** option, the table becomes
accessible via its name and trying to create a duplicate named table
will result in an error:

</div>

</div>

</div>

</div>

<div>

<div>

<div>

+-----------------------------------------------------------------------+
| ::: {.highlight style="background: #f8f8f8"}                          |
| ``` {style="line-height: 125%"}                                       |
| iex(1)> :ets.new(:my_table                                            |
| , [:named_table])  :my_table iex(2)> :ets.insert(:my_table, {:key_1,  |
| 3}) true iex(3)> :ets.lookup(:my_table, :key_1)  [key_1: 3] iex(4)> : |
| ets.new(:my_table, [:named_table])  ** (ArgumentError) argument error |
| ```                                                                   |
| :::                                                                   |
+-----------------------------------------------------------------------+

\

</div>

</div>

</div>

<div>

<div>

\

</div>

</div>

<div>

<div>

<div>

In this sense, a table name resembles a locally registered process name.
It's a symbolic name of a table, and it relieves you of having to pass
around the ETS reference 

</div>

</div>

</div>


