defmodule IdenticonnerServer do
  use Plug.Router

  plug(Plug.Logger)
  plug(CORSPlug)
  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong!")
  end

  get "/:id" do
    b64_image = Identiconner.base64(id)
    send_resp(conn, 200, b64_image)
  end

  match _ do
    send_resp(conn, 404, "There's nothing here, man.")
  end
end
