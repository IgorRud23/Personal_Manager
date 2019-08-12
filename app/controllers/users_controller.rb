class UsersController < ApplicationController
  before_actin :user

  def user
    @user = current_user
  end

end
