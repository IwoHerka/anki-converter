### Question
What are some of the reasons for running code in a Server process?


### Answer
\* The code must manage a long-running state

<div>

\* The code handles a resource that can and should be reused like TCP
connection, file handles, database connection etc.

</div>

<div>

\* Critical section of the code need to be synchronized. Only one
process can execute that code at any moment. 

</div>


