defmodule Portal.Router do
  use Plug.Router
  alias Portal.Repo
  alias Portal.Links

  plug :match
  plug :dispatch

  post "/:key/to/:url" do
    changeset  = %Links{ key: key, url: url }
    Repo.insert(changeset)
    IO.inspect Repo.all(Links)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{ key: key, url: url }))
  end

  get "/:key" do
    conn
    |> Plug.Conn.resp(:found, "")
    |> Plug.Conn.put_resp_header("location", "https://google.com")
  end

  get "/g/:key" do
    conn
    |> Plug.Conn.resp(:found, "")
    |> Plug.Conn.put_resp_header("location", "https://github.com/blinfoldking/#{key}")
  end
end
