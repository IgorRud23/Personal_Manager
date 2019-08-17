class UsersController < ApplicationController
  before_actin :user

  def show
  end

  private

  def user
    @user = current_user
  end

end
