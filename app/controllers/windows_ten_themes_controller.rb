class WindowsTenThemesController < ApplicationController
  before_action :find_windows
  def index
    @windows_ten_themes = WindowsTenTheme.all
  end

  def show
    @windows_ten_theme.views +=1
    @windows_ten_theme.save
  end

  private

  def find
    @windows_ten_theme = WindowsTenTheme.find(params[:id])
  end
end
