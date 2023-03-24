### Question
How do you parse commandline arguments in Elixir?


### Answer
`OptionsParser.parse(argv, options\\[])` parses argv into a keyword
list.

The following options are supported:\
- :switches or :strict - see the "Switch definitions" section below\
- :allow\_nonexistent\_atoms - see the "Parsing dynamic switches"
section below\
- :aliases - see the "Aliases" section below

It returns a three-element tuple with the form
`{parsed, args, invalid}`, where:\
1. *parsed* is a keyword list of parsed switches with
`{switch_name, value}` tuples in it; switch\_name is the atom
representing the switch name while value is the value for that switch
parsed according to opts\
2. *args* is a list of the remaining arguments in argv as strings\
3. *invalid* is a list of invalid options as {option\_name, value} where
option\_name is the raw option and value is nil if the option wasn't
expected or the string value if the value didn't have the expected type
for the corresponding option

Let\'s say you need to parse the command line:\
`>myprogram --user mike@github.com --project elixir-lang --issues 10`

::: {.codehilite style="background: #f8f8f8" align="left"}
``` {style="line-height: 125%"}
iex> argv = ["-u","mike@github.com","--project", "elixir-lang", "--issues", "9"] ["-u", "mike@github.com", "--project", "elixir-lang", "--issues", "9"] iex(60)> OptionParser.parse(argv, switches: [ user: :string, project: :string, issues: :integer], aliases: [ u: :user, p: :project, i: :issues ]) {[user: "mike@github.com", project: "elixir-lang", issues: 9], [], []} 
```
:::


