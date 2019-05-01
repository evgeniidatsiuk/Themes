class SystemsController < ApplicationController

  def index
    @systems = System.all

   end

  def show
  @system = System.find_by(name: params[:id])
    @themes = @system.theme

  end

  # def category
  #  @tags=.where(system_id: System.find_by_name(params[:name]).id)
  # end
end
