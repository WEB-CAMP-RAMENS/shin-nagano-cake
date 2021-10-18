class ApplicationController < ActionController::Base
   def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    end
   end
    def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_admin_session_path #後でやるとこ
    end
    end
end
