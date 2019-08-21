class GymListsController < ApplicationController

  def index
    @gym_lists = GymList.all
  end

end
