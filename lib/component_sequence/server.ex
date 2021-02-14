defmodule ComponentSequence.Server do
  use GenServer
  alias ComponentSequence.Impl

  def init(initial_number) do
    {:ok, ComponentSequence.Stash.API.get()}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, Impl.next(current_number)}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, Impl.increment(current_number, delta)}
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.API.update(current_number)
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect(state)}', and I'm happy"}]]
  end
end
