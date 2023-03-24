### Question
Explain Phoenix layers.


### Answer
    connection
      |> endpoint()
      |> router()
      |> pipelines()
      |> controller()

\
Each request comes in through an endpoint, the first point of contact.
It's literally the end, or the beginning, of the Phoenix world. A
request comes into an endpoint. From there, requests go into our router
layer, which directs a request into the appropriate controller, after
passing it through a series of pipelines. As you might expect, a
pipeline groups functions together to handle common tasks. You might
have a pipeline for browser requests, and another for JSON requests.


