class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_name(params[:id])
    @themes = @category.tags.where(object_type: 'Theme').map { |x| Theme.find(x.object_id) }
    end
end
