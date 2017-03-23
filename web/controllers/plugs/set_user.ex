defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)
    assign(conn, :current_user, user_id && Repo.get(User, user_id))
  end
end
