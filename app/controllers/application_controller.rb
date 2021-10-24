class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      customers_my_page_path
    end
   end

    def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path #後でやるとこ
    end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number])
  end
end
