class SystemsController < ApplicationController

        def index
          @systems = System.all
         end

        def show
          @system = System.find_by_name(params[:id])
          @themes = @system.tags.where(object_type: 'Theme').map { |x| Theme.find(x.object_id) }
        end

        #def category
        #  @tags=.where(system_id: System.find_by_name(params[:name]).id)
        #end
end
