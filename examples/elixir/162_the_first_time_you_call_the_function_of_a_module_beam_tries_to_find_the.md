### Question
The first time you call the function of a module, BEAM tries to find the
corresponding file on the disk. The VM looks for the file in the current
folder and then in the code paths. What is the function to list all the
code paths under which BEAM checks for modules if it can\'t find it in
current directory?


### Answer
    :code.get_path()


