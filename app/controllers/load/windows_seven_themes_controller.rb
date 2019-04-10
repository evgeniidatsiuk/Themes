class Load::WindowsSevenThemesController < ApplicationController
  def index
    @windows_seven_themes = WindowsSevenTheme.all
  end

  def show
    @windows_seven_theme = WindowsSevenTheme.find(params[:id])
  end
end
