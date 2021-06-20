module ApplicationHelper

  def after_sign_in_path(resource)
    if resource.admin?
      root_path
    else
      edit_user_registration_path(id: resource)
    end    
  end

end
