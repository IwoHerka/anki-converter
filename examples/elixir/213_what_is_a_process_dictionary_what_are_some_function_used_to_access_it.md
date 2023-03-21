### Question
What is a process dictionary; what are some function used to access it?


### Answer
[As the name implies, process dictionaries are dictionaries belonging to
specific process where the keys and values can be any term (any type of
value).
The ]{style="background-color: rgb(255, 255, 255);"}`Process.get/1`[, ]{style="background-color: rgb(255, 255, 255);"}`Process.put/2`[ and ]{style="background-color: rgb(255, 255, 255);"}`Process.delete/1`[ functions
(and other from Process module) are used to manipulate the current
process dictionary. PDs are isolated and belong to specific
process.]{style="background-color: rgb(255, 255, 255);"}


