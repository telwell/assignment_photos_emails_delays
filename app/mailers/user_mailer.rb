class UserMailer < ApplicationMailer
	default :from => "me@trevorelwell.com"

	def welcome(user)
		@user = user
		mail(to: @user.email, subject: "It's my first email from Rails!")
	end
end
