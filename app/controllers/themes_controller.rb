class ThemesController < ApplicationController
  before_action :find_theme, only: %i[show edit update]

    def index
      @themes = Theme.all
    end

    def new
      @theme = Theme.new
    end

    def create
      @all_tags = params[:theme][:all_tags]
      @theme = current_user.themes.build(theme_params)
       if @theme.save
       Tag.all_tags(@theme, @all_tags)
        redirect_to theme_path(@theme.id)
      else
       render 'new'
       end
    end

    def show
     @theme.views +=1
     @theme.save
    end

    private

    def find_theme
      @theme = Theme.find(params[:id])
    end
    def theme_params
      params.require(:theme).permit(:name,:description, :download, :system_id,:views, :user_id, photos:[])
  end

end
