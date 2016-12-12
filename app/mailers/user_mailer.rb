class UserMailer < ApplicationMailer
  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Testr') do |format|
      format.mjml
    end
  end
end
