class WindowsEightThemesController < ApplicationController
  before_action :find_windows, only: %i[show edit update]

  def index
    @windows_eight_themes = WindowsEightTheme.all
  end

  def new
    @windows_eight_theme = WindowsEightTheme.new
  end
  def create
@all_tags = params[:windows_eight_theme][:all_tags]
@windows_eight_theme = current_user.windows_eight_themes.build(win_params)
if @windows_eight_theme.save
Tag.all_tags(@windows_eight_theme, @all_tags)
redirect_to windows_eight_theme_path(@windows_eight_theme.id)
else
render 'new'
end
end

  def show
   @windows_eight_theme.views +=1
   @windows_eight_theme.save
  end

  private

  def find_windows
    @windows_eight_theme = WindowsEightTheme.find(params[:id])
  end
  def win_params
    params.require(:windows_eight_theme).permit(:name,:description, :download, :system_id, :guide, :user_id, :admin_user_id, photos:[])
  end
end
