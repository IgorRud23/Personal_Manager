class GymListsController < ApplicationController

  def index
    @gym_list = GymList.all
  end
  
end
