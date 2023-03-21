### Question
What is tail call optimization? 


### Answer
It is the process by which a smart compiler can make a call to a
function and take no additional stack space. The only situation in which
this happens is if the last instruction executed in a function `f` is a
call to a function `g`. (Note: *if `f` calls itself then it becomes tail
recursion*) The key here is that `f` no longer needs stack space - it
simply calls `g` and then returns whatever `g` would return. In this
case the optimization can be made that `g` just runs and returns
whatever value it would have to the thing that called `f`.

Consider, for a moment, this simple function:

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
sub foo (int a) {   a += 15;   return bar(a); } 
```
:::

So the sequence of events looks like:

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
STACK ALLOCATE FOO (do stuff) call function bar STACK ALLOCATE BAR STACK DEALLOCATE BAR RETURN WITH VALUE STACK DEALLOCATE FOO RETURN WITH VALUE 
```
:::

If you look at it, the stack space that `foo` has isn\'t used after the
`bar` function is called. While this isn\'t a huge amount of space, it
is space, and space that isn\'t needed. If it was *freed* before `bar`
was called, your program would be a little more space-efficient. For one
function this isn\'t a big deal, but imagine what happens if you\'re 200
levels deep in a call (perhaps because there\'s some indirect recursion)
and 100 of those levels look like `return somefunc();`. That\'s 100
chunks of stack that are being used for no reason. If your stack only
had space for 199 chunks, not using those 100 chunks of stack would mean
the difference between your program running and your program crashing.

So, what can you, or rather your language compiler, do? Well, what it
can do is turn code of the form `return somefunc();` into the low-level
sequence `pop stack frame; goto somefunc();`. In our example, that means
before we call `bar`, `foo` *cleans itself up* and then, rather than
calling `bar` as a subroutine, we do a *low-level goto* operation to the
*start of bar*. `foo` has already cleaned itself out of the stack, so
when `bar` starts it looks like whoever called `foo` has really called
`bar`, and when `bar` returns its value, it returns it *directly to
whoever called `foo`*, rather than returning it to `foo` which would
then return it to its caller.

[Further
reading](http://web.archive.org/web/20111030134120/http://www.sidhe.org/~dan/blog/archives/000211.html)


