defmodule Meteorappapi.PageController do
  use Meteorappapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
