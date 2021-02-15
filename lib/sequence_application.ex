defmodule SequenceApplication do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: ComponentSequence.Stash.API,
        start:
          {ComponentSequence.Stash.API, :start_link,
           [
             Application.get_env(:component_sequence, :initial_number)
           ]}
      },
      %{
        id: ComponentSequence.API,
        start: {ComponentSequence.API, :start_link, [nil]}
      }
    ]

    opts = [strategy: :rest_for_one, name: ComponentSequence.API.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
