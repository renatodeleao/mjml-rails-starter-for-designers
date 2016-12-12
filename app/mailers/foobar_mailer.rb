# ./app/mailers/foobar_mailer.rb
class FoobarMailer < ActionMailer::Base
  def baz(name)
    @name = name

    mail(to: 'test@example.com', subject: 'test') do |format|
      format.mjml { render :layout => 'mailer' }
    end
  end
end