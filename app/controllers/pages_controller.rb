class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  #  @systems = System.all
  #  @themes = Theme.all
  end
end
