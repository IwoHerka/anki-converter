### Question
What is an Agent?


### Answer
Agents are a simple abstraction around state. Often in Elixir there is a
need to share or store state that must be accessed from different
processes or by the same process at different points in time. The Agent
module provides a basic server implementation that allows state to be
retrieved and updated via a simple API. Here is an example of simple
counter implemented as an Agent:\
\

    defmodule Counter do
      use Agent

      def start_link(initial_value) do
        Agent.start_link(fn -> initial_value end, name: __MODULE__)
      end

      def value do
        Agent.get(__MODULE__, & &1)
      end

      def increment do
        Agent.update(__MODULE__, &(&1 + 1))
      end
    end


