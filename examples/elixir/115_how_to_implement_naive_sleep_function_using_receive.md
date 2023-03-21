### Question
How to implement naive sleep function using receive?


### Answer
    sleep(T) ->
      receive
      after T ->
        true
      end.


