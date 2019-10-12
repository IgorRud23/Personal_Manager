class SchedulesController < ApplicationController

  def index
    if params[:user_id]
      @schedules = User.find(params[:user_id]).schedules
      @user = User.find(params[:user_id])
    else
      redirect_to user_schedules_path
    end
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      @user = current_user
      redirect_to user_schedule_path(@user, @schedule)
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      flash[:notice] = 'User not found.'
      redirect_to new_user_registration_path
    else
      @schedule = Schedule.new(user_id: params[:user_id])
    end
  end

  def update
    @schedule = schedule
    @schedule.update(schedule_params)
    if @schedule.errors.none?
      @user = current_user
      redirect_to user_schedule_path(@user, @schedule)
    else
      render :edit
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to new_user_registration_path, flash[:notice] = 'User not found.'
      else
        @schedule = user.schedules.find_by(id: params[:id])
        redirect_to user_schedules_path(user),
        flash[:notice] = 'Schedule not found.' if @schedule.nil?
      end
    else
      @schedule = schedule
      @user = current_user
    end
  end

  def show
    @schedule = schedule
    @user = current_user
  end

  def destroy
    schedule.destroy
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date_day, :date_time, :exercise_type, :user_id, :client_id, :gym_list_id)
  end

  def schedule
    @schedule ||= Schedule.find(params[:id])
  end

  end
