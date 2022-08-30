class UserMailer < ApplicationMailer
    def welcome_user(user)
        @user = user
        
    end
end
