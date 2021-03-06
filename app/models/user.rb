class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :current_password 

  validates :username, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9_-]/, message: 'Please use only letters and numbers as your username.'}
  has_many :bookcovers

end
