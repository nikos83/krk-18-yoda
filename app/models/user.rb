class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :buckets
  has_many :documetns, through: :buckets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
