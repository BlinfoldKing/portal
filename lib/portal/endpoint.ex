defmodule Portal.Endpoint do
  use Plug.Router

  plug :match

  plug(
    Plug.Parsers,
    parsers: [:json, :urlencoded],
    pass: ["application/json"],
    body_reader: {CacheBodyReader, :read_body, []},
    json_decoder: Poison
  )

  plug :dispatch

  forward "/", to: Portal.Router

  match _ do
    send_resp conn, 404, "Error for now"
  end


  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    Plug.Cowboy.http(__MODULE__, [])
  end
end
