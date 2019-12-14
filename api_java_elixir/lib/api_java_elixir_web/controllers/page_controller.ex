defmodule ApiJavaElixirWeb.PageController do
  use ApiJavaElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
