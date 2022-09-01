class UserMailer < ApplicationMailer
    def welcome_user(user)
        @user = user
        @url = 'http://google.com'
        mail(to: user.username, subject: 'Welcome to my website!')
    end
end
