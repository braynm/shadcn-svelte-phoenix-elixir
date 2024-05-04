defmodule ShadWeb.PageController do
  use ShadWeb, :controller

  def home(conn, _params) do
    render(conn, :components, layout: false)
  end

  def dashboard(conn, _params) do
    render(conn, :dashboard, layout: false)
  end
end
