defmodule FareWeb.PowResetPassword.MailerView do
  use FareWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
