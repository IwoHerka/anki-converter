### Question
What is `case` control flow format?


### Answer
    case value do
       pattern 1 {when guard-clause 1} -> expression 1
       pattern 2 {when guard-clause 2} -> expression 2
       ...
       pattern n {when guard-clause n} -> expression n
    end

Usage example:

    case {1, 2, 3} do
      {1, x, 3} when x > 0 -> "Will match"
      _ -> "Would match, if guard condition were not satisfied"
    end


