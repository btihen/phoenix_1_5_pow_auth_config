defmodule FareWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  alias FareWeb.Router.Helpers, as: Routes

  # go to the page_controller on sign out (or whatever the landing page controller is)
  def after_sign_out_path(conn), do: Routes.page_path(conn, :index)
end
