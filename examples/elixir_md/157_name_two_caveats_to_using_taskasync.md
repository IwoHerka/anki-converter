### Question
Name two caveats to using `Task.async/1`.


### Answer
There are two important things to consider when using async:\
\

-   If you are using async tasks, you must await a reply as they are
    always sent. If you are not expecting a reply, consider using
    `Task.start_link/1` as detailed below.
-   async tasks link the caller and the spawned process. This means
    that, if the caller crashes, the task will crash too and vice-versa.
    This is on purpose: if the process meant to receive the result no
    longer exists, there is no purpose in completing the computation.

\
\
If this is not desired, you will want to use supervised tasks.


