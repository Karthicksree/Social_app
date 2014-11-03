class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

       acts_as_voter
       has_many :posts, dependent: :destroy
       has_many :comments, dependent: :destroy
       has_many :friendships
       has_many :friends, :through => :friendships
       has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
       has_many :inverse_friends, :through => :inverse_friendships, :source => :user
       has_one :profile, dependent: :destroy
       accepts_nested_attributes_for :profile
       accepts_nested_attributes_for :posts
       accepts_nested_attributes_for :comments
end
