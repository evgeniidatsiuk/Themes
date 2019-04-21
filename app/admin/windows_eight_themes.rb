ActiveAdmin.register WindowsEightTheme do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :name,:description, :download, :system_id, :guide, :user_id, :admin_user_id, photos:[]

form html: { multipart: true } do |f|
   f.semantic_errors

   f.inputs do
     f.input :admin_user_id, :label => "Admin", :as => :select, :collection => AdminUser.all.map{|u| ["#{u.email}", u.id]}
     f.input :user_id, :label => "User", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
     f.input :system_id, :label => "System", :as => :select, :collection => System.all.map{|u| ["#{u.name}", u.id]}
     f.input :name
     f.input :guide
     f.input :download
     f.input :photos, as: :file, input_html: { multiple: true }
     f.input :description
   end
   actions
end

end
