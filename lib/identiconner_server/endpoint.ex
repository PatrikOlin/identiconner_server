defmodule IdenticonnerServer.Endpoint do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong!")
  end

  match _ do
    send_resp(conn, 404, "There's nothing here, man.")
  end
end
