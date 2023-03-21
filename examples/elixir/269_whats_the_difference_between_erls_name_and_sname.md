### Question
What\'s the difference between erl\'s `-name` and `-sname`?


### Answer
When we have two nodes on the same machine, we use "short" names (as
indicated by the `-sname` flag), but if they are on different networks,
we use `-name`. We can also use `-sname` on two different machines when
they are on the same subnet. Using `-sname` is also the only method that
will work if no DNS service is available. Short name will append
localhost, e.g. `-sname gandalf` will give `gandalf@localhost`.


