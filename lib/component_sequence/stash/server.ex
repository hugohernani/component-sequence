defmodule ComponentSequence.Stash.Server do
  use GenServer
  alias ComponentSequence.Stash.Impl

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call({:get}, _from, current_number) do
    {:reply, current_number, Impl.get(current_number)}
  end

  def handle_cast({:update, new_number}, _current_number) do
    {:noreply, Impl.update(new_number)}
  end
end
