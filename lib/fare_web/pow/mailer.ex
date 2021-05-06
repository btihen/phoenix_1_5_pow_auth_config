
defmodule FareWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  use Bamboo.Mailer, otp_app: :fare
  import Bamboo.Email
  require Logger


  @impl true
  def cast(%{user: user, subject: subject, text: text, html: html}) do
    # forward email Struct - use for logging when Bamboo disabled
    # %{to: user.email, subject: subject, text: text, html: html}

    # for use when Bamboo is configured
    new_email(
      to: user.email,
      from: "fare@example.com",
      subject: subject,
      html_body: html,
      text_body: text
    )
  end

  @impl true
  def process(email) do
    # log email sent
    Logger.debug("E-mail sent: #{inspect email}")

    # enable when `bamboo` configured
    deliver_now(email)
  end
end
