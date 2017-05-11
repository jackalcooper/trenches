defmodule Trenches.Web.SessionController do
  use Trenches.Web, :controller

  alias Trenches.PlayerRepo

  def new(conn, _params) do
    render conn, "login.html"
  end

  def create(conn, %{"user" => user}) do
    case PlayerRepo.get(user) do
      {:error, reason} -> 
        conn
        |> put_flash(:error, reason)
        |> render "login.html"
      player ->
        conn
        |> Trenches.Web.Auth.login(player)
        |> put_flash(:info, "Welcome back #{player.name}!")
        |> redirect(to: page_path(conn, :index))
    end

  end
end
