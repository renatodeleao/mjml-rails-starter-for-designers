# Preview all emails at http://localhost:3000/rails/mailers/
class FoobarMailerPreview < ActionMailer::Preview
  def baz
    FoobarMailer.baz('Teste Name')
  end
end
