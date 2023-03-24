### Question
How do you import a specific function in a module?


### Answer
Using the `only` option with `import`. For example:

    import List, only: [flatten: 1]

\
This will import only the `flatten` method of the `List` module. The
full syntax of `import` is:

    import Module [, only:|except: ] list_of_functions


