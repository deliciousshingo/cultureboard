class UsersController < ApplicationController

def show
  @boards = current_user.boards
end
end
