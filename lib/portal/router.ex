defmodule Portal.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message()))
  end

  def message do
    %{
      response_type: "in_channel",
      text: "Hello World :)"
    }
  end
end
