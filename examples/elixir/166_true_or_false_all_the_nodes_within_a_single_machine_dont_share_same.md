### Question
True or False: All the nodes within a single machine don\'t share same
cookie.


### Answer
False. The first time you start a BEAM instance, a random cookie is
generated for you and persisted in your home folder in the
.erlang.cookie file. By default, all nodes you start on that machine
will have this cookie.

<div>

\

</div>

<div>

A node running on another machine will have a different cookie, so
connecting two nodes on different machines won't work by default; you
need to somehow make all nodes use the same cookie. 

</div>


