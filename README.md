# MJML RAILS STARTER

Coding html emails in rails env.
It uses `mjml-rails` as templating and `letter_opener` to preview emails in the browser.

### Requirements
This was only tested in
* `Rails 5.0^`
* `ruby 2.3.1p112 (2016-04-26 revision 54768)`

### setup

* `bundle install`
* `rails s`
* go to `localhost:3000/rails/mailers` to display a list of the current emails.

### Create an email

First, create your mailer controller (is it a controller? actually have no idea) that lives inside `app/mailers/` caller `badjoras_mailer.rb`, it should look like this

```Ruby
class BadjorasMailer < ApplicationMailer
  def badjoras(user)
    @user = user
    mail(to: @user, subject: 'Test') do |format|
      format.mjml
    end
  end
end
```

Secondly, create a corresponding view `badjoras.mjml` file in the `app/views/example_mailer` (it should match the controller name)

```ERB
<mjml>
  <mj-body>
    <mj-container>
      <mj-text>Welcome <%= @name =%> to the world of Badjoras</mj-text>
    </mj-container>
  </mj-body>
</mjml>
```

and you can use partials 🎊 (note that [formats property must be html](http://dev.edenspiekermann.com/2016/06/02/using-mjml-in-rails/))
```ERB
<mjml>
  <mj-body>
    <mj-container>
    	<!-- Email header that lives in ./app/views/badjoras_mailer/_badjoras_header.mjml -->
      	<%= render partial: 'badjoras_header', formats: [:html] %>
  
      	<mj-text>Welcome <%= @name =%> to the world of Badjoras</mj-text>
    </mj-container>
  </mj-body>
</mjml>
```


Finally in order to preview the email in the browser, add this two magic lines to `development.rb`
```Ruby
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :letter_opener
```

and create a preview file `example_mailer_preview.rb`inside `test/mailers/previews`, it should look like this

```Ruby
# Preview all emails at http://localhost:3000/rails/mailers/
class BadjorasrMailerPreview < ActionMailer::Preview
  def badjoras
    BadjorasMailer.badjoras('Teste Name')
  end
end
```

*Uff that's a wrap*



### Thanks
* To the folks o https://mjml.io for helping fighting the HTML email development war.
* Hugo Giraudel for the [inspiring article](http://dev.edenspiekermann.com/2016/06/02/using-mjml-in-rails/)
* To the internet, making designers navigate upstream the developer river, even without having a single clue of what they're doing. (Sry i don't remember the url of the 100 article + stackoverflow questions)


### Notes
* This has unecessary `user` database stuff, I probably have created those while following one of the 10 tutorials, but you can ignore that part. When I discover how to remove them, I'll updated the repo.
* Found this repo name offensive and misleading relative to the designer working class? Shoot me a tweet, I might read it while taking a big dump.