defmodule GoalspotWeb.PageController do
  use GoalspotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
