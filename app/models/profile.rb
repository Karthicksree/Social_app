class Profile < ActiveRecord::Base
  
  enum gender: [:male, :female] 
 
  belongs_to :user


end
