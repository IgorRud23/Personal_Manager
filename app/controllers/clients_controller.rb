class ClientsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @clients = User.find(params[:user_id]).clients
    else
      redirect_to user_clients_path
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      @user = current_user
      redirect_to user_client_path(@user, @client)
    else
      render :new
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      flash[:notice] = 'User not found.'
      redirect_to new_user_registration_path
    else
      @client = Client.new(user_id: params[:user_id])
    end
  end

  def show
    @client = client
    @user = current_user
  end

  def update
    @client = client
    @client.update(client_params)
    if @client.errors.none?
      @user = current_user
      redirect_to user_client_path(@user, @client)
    else
      render :edit
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        flash[:notice] = 'User not found.'
        redirect_to new_user_registration_path
      else
        @client = user.clients.find_by(id: params[:id])
        redirect_to user_clients_path(user), flash[:notice] = 'Client not found.' if @client.nil?
      end
    else
      @client = client
      @user = current_user
    end
  end

  def destroy
    client.destroy
    redirect_to root_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :weight, :height, :user_id)
  end

  def client
    @client ||= Client.find(params[:id])
  end

end
