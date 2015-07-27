class RegistrationController <  Devise::RegistrationsController
  
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  respond_to :json
 
end
