### Question
What is the purpose of the pin operator (`^`)?


### Answer
Variables in Elixir can be rebound. By using `^` operator, user can
prevent the pattern matching from assigning value and force the matching
operation. For example:\

    n = 1
    n = 2    # Ok
    ^n = 3   # MatchError


