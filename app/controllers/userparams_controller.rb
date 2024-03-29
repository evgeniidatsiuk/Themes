class UserparamsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_user, only: %i[show edit update]

  def new
    if current_user.userparam
      redirect_to userparam_path(@userparam.id)
    else
      @userparam = Userparam.new
    end
  end

  def create
    @userparam = current_user.build_userparam(profile_params)
    if @userparam.save
      redirect_to userparam_path(@userparam.id)
    else render 'new'
    end
  end

  def show; end

  def edit
    @userparam = current_user.userparam
  end

  def update
    # @userparam = Userparam.find_by(user_id: current_user.id)
    if @userparam.update(profile_params)
      redirect_to userparam_path(@userparam.id)
    else render 'edit'
    end
  end

  private

  def profile_params
    params.require(:userparam).permit(:user_id, :firstname, :lastname, :age, :avatar)
  end

  def find_user
    @userparam = Userparam.find(params[:id])
  end
end
