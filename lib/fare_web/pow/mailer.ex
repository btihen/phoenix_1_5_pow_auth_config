
defmodule FareWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  # use Bamboo.Mailer, otp_app: :fare
  require Logger

  # import Bamboo.Email

  @impl true
  def cast(%{user: user, subject: subject, text: text, html: html}) do
    # for use when Bamboo is configured
    # new_email(
    #   to: user.email,
    #   from: "reading-list@example.com",
    #   subject: subject,
    #   html_body: html,
    #   text_body: text
    # )

    # send to logger - disable when
    %{to: user.email, subject: subject, text: text, html: html}
  end

  @impl true
  def process(email) do
    # actually deliver emails - enable when `bamboo` configured
    # deliver_now(email)

    # check email functionality and contents
    Logger.debug("E-mail sent: #{inspect email}")
  end
end
