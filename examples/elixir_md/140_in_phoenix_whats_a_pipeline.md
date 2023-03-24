### Question
In Phoenix, what\'s a pipeline?


### Answer
A pipeline is just a group of plugs that are used for a particular
purpose. In a router, for example, you can have two different pipelines:
one for a typical browser request, and one for a typical API request.\
\
In the browser pipeline, you accept \"html\" requests, getting the
session and the flash (which stores temporary messages for the user,
such as success, info, or warning messages); you set up forgery
protection for your forms; and you put secure browser headers into the
data. In the api pipeline, you only accept \"json\" requests. This makes
sense---why get the flash and set up form forgery protection when a
typical API request doesn't utilize either of those features?


