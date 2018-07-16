class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :async

  has_many :dependents

  validates :name, presence: true
  validates :email, presence: true
  validates :cpf, presence: true

  # def send_devise_notification(notification, *args)
  #   DeviseWorker.perform_async(devise_mailer, notification, id, *args)
  # end
end
