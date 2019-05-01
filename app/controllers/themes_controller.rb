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

  def edit
    @systems = System.all
  end

  def update
    @systems = System.find(params[:system_ids])
    @theme.system.clear
    @theme.system = @systems

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
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :system_id, :description, :download, :views, :user_id, photos: [])
  end

  def find_theme
    @theme = Theme.find(params[:id])
  end
end
