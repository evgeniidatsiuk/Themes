class SystemsController < ApplicationController

        def index
          @systems = System.all
         end

        def show
          @system = System.find_by_name(params[:id])
          @windows_eight_themes = @system.tags.where(object_type: 'WindowsEightTheme').map { |image| WindowsEightTheme.find(image.object_id) }
        end
end
