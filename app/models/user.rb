class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :firstname, :lastname, :birthdate
    validates :email, uniqueness: { case_sensitive: false }, 
              format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
    validates :firstname_kana, :lastname_kana, 
              format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  end
end