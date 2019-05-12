defmodule Portal.Endpoint do
  use Plug.Router

  plug :match

  plug (
    Plug.parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug :dispatch

  match _ do
    send_resp conn, 404, "Error for now"
  end
end
