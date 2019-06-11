class SystemsController < ApplicationController
  def index
    @systems = System.all
   end

  def show
    @systems = System.find_by(name: params[:id])
    @themes = @systems.themes
    @categories = []
    @themes.map do |them|
      them.tags.each do |tag|
        @categories << tag.category_id
      end
    end
    @categories = Category.where(id: @categories)
  end
end
