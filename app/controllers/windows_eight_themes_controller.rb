class WindowsEightThemesController < ApplicationController
  before_action :find

  def index
    @windows_eight_themes = WindowsEightTheme.all
  end

  def show
   @windows_eight_theme.views +=1
   @windows_eight_theme.save
  end

  private

  def find
    @windows_eight_theme = WindowsEightTheme.find(params[:id])
  end
end
