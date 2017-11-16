class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body
    @name = message.name
    @phone_number = message.phone_number
    @email = message.email
    mail to: "mattgrossman40@gmail.com", from: message.email
  end
end
