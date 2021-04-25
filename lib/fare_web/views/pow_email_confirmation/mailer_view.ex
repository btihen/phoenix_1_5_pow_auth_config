defmodule FareWeb.PowEmailConfirmation.MailerView do
  use FareWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
