# Preview all emails at http://localhost:3000/rails/mailers/
class BadjorasMailerPreview < ActionMailer::Preview
  def badjoras
    BadjorasMailer.badjoras('Teste Name')
  end
end
