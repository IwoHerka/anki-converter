### Question
Explain basic function of supervisor process.


### Answer
-   The supervisor process traps exits, and then starts the child
    processes.
-   If at any point in time a child terminates, the supervisor process
    receives a corresponding exit message and performs corrective
    actions, such as restarting the crashed process.
-   If a supervisor process terminates, its children are also taken
    down.


