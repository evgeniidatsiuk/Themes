class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @themes = Theme.all
    @comments = Comment.all
  end
end
