class UsersController < ApplicationController
before_filter :authenticate_user!

def index
	@users = User.all
end

def add_friend
    
end
  
def remove_friend
    
end

def show
	@user = current_user
	
end

end