### Question
What is the purpose of `@impl` before behavior callback?


### Answer
The `@impl` tells the compiler that the function about to be defined is
a callback function and therefore should satisfy behavior contract. If
it doesn\'t conform, you will get a compile-time warning.


