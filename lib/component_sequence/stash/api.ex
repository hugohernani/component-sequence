defmodule ComponentSequence.Stash.API do
  @server ComponentSequence.Stash.Server

  def start_link(initial_number) do
    GenServer.start_link(@server, initial_number, name: @server)
  end

  def get do
    GenServer.call(@server, {:get})
  end

  def update(new_number) do
    GenServer.cast(@server, {:update, new_number})
  end
end
