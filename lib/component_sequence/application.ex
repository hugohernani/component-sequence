defmodule ComponentSequence.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: ComponentSequence,
        start: {ComponentSequence, :start_link, [123]}
      }
    ]

    opts = [strategy: :one_for_one, name: ComponentSequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
