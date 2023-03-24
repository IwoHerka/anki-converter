### Question
What are the uses of module attributes?


### Answer
-   As annotations to instruct compiler - `@moduledoc` and `@doc`
    attributes can be used to provide documentation:

        defmodule Math do 
            @moduledoc """ 
                Provides math-related functions.
                ## Examples
                iex> Math.sum(1, 2)
                3 
              """  
             @doc """
             Calculates the sum of two numbers.
             """
             def sum(a, b), do: a + b end
        end

-   As constants:

        defmodule MyServer do
           @initial_state %{host: "127.0.0.1", port: 3456}
           IO.inspect @initial_state 
        end

    \

-   As temporary storage:

        defmodule MyPlug do
           use Plug.Builder
           plug :set_header
           plug :send_ok
           def set_header(conn, _opts) do 
              put_resp_header(conn, "x-header", "set")
           end
           def send_ok(conn, _opts) do
              send(conn, 200, "ok")
           end
        end
        IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
        Plug.Adapters.Cowboy.http MyPlug, []

    In the example above, we have used the `plug/1` macro to connect
    functions that will be invoked when there is a web request.
    Internally, every time you call `plug/1`, the Plug library stores
    the given argument in a `@plugs` attribute. Just before the module
    is compiled, Plug runs a callback that defines a function (`call/2`)
    which handles HTTP requests. This function will run all plugs inside
    `@plugs` in order.\


