defmodule SequenceApplication do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: ComponentSequence.API,
        start: {ComponentSequence.API, :start_link, [123]}
      }
    ]

    opts = [strategy: :one_for_one, name: ComponentSequence.API.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
