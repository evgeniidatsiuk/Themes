class UserparamsController < ApplicationController
  before_action :authenticate_user!

    def new
      @userparam = Userparam.new
    end

    def create
      @userparam = current_user.build_userparam(profile_params)
      if @userparam.save
        redirect_to userparam_path(current_user.id)
      else render 'new'
      end

    end

    def show
    end

    def edit
      @userparam = current_user.userparam
    end

    def update
      @userparam = Userparam.find_by(user_id: current_user.id)
      if @userparam.update(profile_params)
         redirect_to userparam_path(current_user.id)
      else render 'edit'
      end

    end

  private

    def profile_params
      params.require(:userparam).permit(:user_id, :nickname, :firstname, :lastname, :age, :avatar)
  end
end
