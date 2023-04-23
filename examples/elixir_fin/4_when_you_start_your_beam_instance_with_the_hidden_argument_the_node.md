### Question
When you start your BEAM instance with the `--hidden` argument, the node
isn't seen in other nodes' connected lists (and vice versa). In what
scenario this is useful?


### Answer
A simple example is starting a local node that acts as a remote shell to
another node. Another example is an instrumentation tool - a node that
connects to another node, collects all sorts of metrics from it, and
presents the results in a GUI.

Such nodes are helpers that shouldn't be part of the cluster, and you
usually don't want them to be seen as such. For this purpose, you can
make a hidden connection


distribution
