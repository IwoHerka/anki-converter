### Question
What happens with original message sent to GenServer after receive block
times out on the sender side?


### Answer
Nothing. Original message remains in server queue and will be processed
at some point. Timeout only means that client stopped waiting for it.


