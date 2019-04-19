class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body
    @name = message.name
    @phone_number = message.phone_number
    @email = message.email
    mail to: "grossmanmatt@yahoo.com", from: "hathawayhomes@mail.com"
  end
end
