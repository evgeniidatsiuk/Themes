class WindowsSevenThemesController < ApplicationController
  before_action :find_windows
  def index
    @windows_seven_themes = WindowsSevenTheme.all
  end

  def show
    @windows_seven_theme.views +=1
    @windows_seven_theme.save
    end

  private

  def find_windows
    @windows_seven_theme = WindowsSevenTheme.find(params[:id])
  end
end
