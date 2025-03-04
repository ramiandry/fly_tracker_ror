class UserMailer < ApplicationMailer
  default from: "no-reply@flywatch.com"  # Adresse d'expéditeur par défaut

  # Méthode pour envoyer un email de bienvenue
  # def welcome_email(user)
  #   @user = user
  #   @url  = "http://localhost:7000"
  #   mail(to: @user.email, subject: "Bienvenue chez MyApp!")
  # end

  def welcome_email(email)
    @email = email
    @url  = "http://localhost:7000"
    mail(to: @email, subject: "Bienvenue chez MyApp!")
  end
end
