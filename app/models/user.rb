class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :tasks, through: :projects
  has_many :messages
  has_many :documents

  mount_uploader :photo, PhotoUploader

  after_create :send_welcome_email

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = SecureRandom.urlsafe_base64
      user.remote_photo_url = auth.info.image
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
