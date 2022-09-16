class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.order(first_name: :asc, last_name: :asc).page(params[:page]).per(10)
  end

  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      redirect_to users_path, notice: 'User successfully created.'
    else
      render :new, alert: 'Something went wrong. Please try again.'
    end
  end

  def edit
  end

  def update
    if @user.update(permitted_params)
      redirect_to users_path, notice: 'User successfully updated.'
    else
      render :edit, alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    if @user.destroy
      message = { notice: 'User successfully destroyed.' }
    else
      message = { alert: 'Something went wrong. Please try again.' }
    end
    redirect_to users_path, message
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def permitted_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :email,
      :status,
      permission_ids: []
    )
  end
  
end