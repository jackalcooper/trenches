defmodule Trenches.Web.LobbyController do
  use Trenches.Web, :controller

  plug :authenticate when action in [:index]

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp authenticate(conn, _opts) do
    user = Map.get(conn.assigns, :current_user)
    if user != nil do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt
    end
  end
end