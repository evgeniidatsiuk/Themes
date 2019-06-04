class ThemesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :find_theme, only: %i[show edit update]

  def index
    @themes = Theme.all
    @categories = Category.all
    end

  def new
    @systems = System.all

    @theme = Theme.new
  end

  def create
    @systems = System.find(params[:system_ids])
    @all_tags = params[:theme][:all_tags]
    @theme = current_user.themes.build(theme_params)

    if @theme.save
      @theme.systems = @systems

      Tag.all_tags(@theme, @all_tags)
      redirect_to theme_path(@theme.id)
    else
      render 'new'
    end
  end

  def like
    @theme = Theme.find(params[:id])
    if !@theme.likes.find_by(user_id: current_user.id)
      @theme.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def dislike
    @theme = Theme.find(params[:id])
    if !@theme.dislikes.find_by(user_id: current_user.id)
      @theme.dislikes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end
  def edit
    @systems = System.all
  end

  def update
    @systems = System.find(params[:system_ids])
#   @theme.systems.clear
    @theme.systems = @systems
    @theme.update(theme_params)
    redirect_to theme_path(@theme.id)
    end

  def destroy
    @theme.destroy
    redirect_to themes_path
  end

  def show
    @theme.views += 1
    @theme.save
    @comments=Comment.where(theme_id: @theme.id).order(created_at: :desc)
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :download, :views, :user_id, photos: [])
  end

  def find_theme
    @theme = Theme.find(params[:id])
  end
end
