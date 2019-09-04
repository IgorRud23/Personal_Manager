class UsersController < ApplicationController
  before_action :user

  def show
  end

  private

  def user
    @match = User.max_clients
    @trainer = User.find_by_id(@match[0])
    @total_clients = @match[1]
    @user = current_user
  end

end
