defmodule ShadWeb.PageController do
  use ShadWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :components, layout: false)
  end
end
