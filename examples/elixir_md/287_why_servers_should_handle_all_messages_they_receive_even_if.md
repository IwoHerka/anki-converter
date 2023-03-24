### Question
Why servers should handle all messages they receive (even if
unexpected)?


### Answer
Because if message queue always grows it will crash the system at some
point, or at least cause process slowdown. Each message should be
processed or ignored.


