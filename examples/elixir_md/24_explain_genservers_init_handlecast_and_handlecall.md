### Question
Explain `GenServer`\'s `init`, `handle_cast` and `handle_call`.


### Answer
-   `init/1` accepts one argument. This is the second argument provided
    to `GenServer.start/2`, and you can use it to pass data to the
    server process while starting it.
-   The result of `init/1` must be in the format `{:ok, initial_state}`.
-   `handle_cast/2` accepts the request and the state and should return
    the result in the format `{:noreply, new_state}`.
-   `handle_call/3` takes the request, the caller information, and the
    state. It should return the result in the format
    `{:reply, response, new_state}`.

\
For example:\

    defmodule KeyValueStore do
      use GenServer
      
      def init(_) do
        {:ok, %{}}
      end
      
      def handle_cast({:put, key, value}, state) do
        {:noreply, Map.put(state, key, value)}
      end
      
      def handle_call({:get, key}, _, state) do
        {:reply, Map.get(state, key), state}
      end
    end


