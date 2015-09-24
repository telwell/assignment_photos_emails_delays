class User < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

private

	def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end
end