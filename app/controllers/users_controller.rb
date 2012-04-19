class UsersController < ApplicationController
  def index
    @users_solve = User.most_solved
    @users_problem = User.most_created
  end

  def show
    @user = User.find(params[:id])
  end
end
