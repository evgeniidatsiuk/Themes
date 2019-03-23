class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
   # edit_userparam_path(current_user.userparam.id)
   new_userparam_path
  end
end
