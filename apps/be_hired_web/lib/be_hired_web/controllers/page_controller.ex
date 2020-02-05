defmodule BeHiredWeb.PageController do
  use BeHiredWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
