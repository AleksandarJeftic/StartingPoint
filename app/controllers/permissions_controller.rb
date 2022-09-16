class PermissionsController < ApplicationController
  before_action :find_permission, only: %i[show edit update destroy]

  def index
    @permissions = Permission.order(code: :asc).page(params[:page]).per(10)
  end

  def show
  end
  
  def new
    @permission = Permission.new
  end

  def create
    @permission = Permission.new(permitted_params)
    if @permission.save
      redirect_to permissions_path, notice: 'Permission successfully created.'
    else
      render :new, alert: 'Something went wrong. Please try again.'
    end
  end

  def edit
  end

  def update
    if @permission.update(permitted_params)
      redirect_to permissions_path, notice: 'Permission successfully updated.'
    else
      render :edit, alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    if @permission.destroy
      message = { notice: 'Permission successfully destroyed.' }
    else
      message = { alert: 'Something went wrong. Please try again.' }
    end
    redirect_to permissions_path, message
  end

  private

  def find_permission
    @permission = Permission.find(params[:id])
  end

  def permitted_params
    params.require(:permission).permit(
      :code,
      :description
    )
  end
end