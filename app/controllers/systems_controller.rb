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

  # def category
  #  @tags=.where(system_id: System.find_by_name(params[:name]).id)
  # end
end
