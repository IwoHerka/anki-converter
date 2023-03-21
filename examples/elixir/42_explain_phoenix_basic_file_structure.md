### Question
Explain Phoenix basic file structure.


### Answer
![](img4330346429945759580.jpg)\
\
Browser files like JavaScript and CSS go into assets and the Phoenix
configu-ration goes into config. Your supervision trees (we'll explore
those more in chapters to come), long-running processes, and application
business logic go into lib/hello. Your web-related code---including
controllers, views, and templates---goes in lib/hello\_web. Predictably,
you'll put tests in test.


