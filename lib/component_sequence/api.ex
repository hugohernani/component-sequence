defmodule ComponentSequence.API do
  @server ComponentSequence.Server

  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
  end

  def next_number do
    GenServer.call(@server, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(@server, {:increment_number, delta})
  end
end
