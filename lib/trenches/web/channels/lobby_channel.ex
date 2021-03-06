defmodule Trenches.Web.LobbyChannel do
  use Phoenix.Channel

  alias Trenches.PlayerRepo
  alias Trenches.Lobby

  def join("lobby", _params, socket) do
    {:ok, socket}
  end

  def handle_in("open_game", %{"game_name" => game_name}, socket) do
    reply = case Lobby.open_game(game_name) do
      :ok ->
        broadcast! socket, "game_opened", %{game_name: game_name}
        {:reply, :ok, socket}
      {:error, reason} -> 
        {:reply, {:error, %{error: reason}}, socket}
    end
  end
end
