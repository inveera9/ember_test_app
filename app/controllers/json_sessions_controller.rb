class JsonSessionsController < Devise::SessionsController
  
  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    
        user = Hash.new
        user["email"] ="#{current_user.email}"
        user["id"] ="#{current_user.id}"
        user["role"] ="#{current_user.roles.first.name}"
        #user.to_json
         render :status => 200, :json => { :error => "Success" ,:user=> user}
    
    
  end
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {
      'csrf-param' => request_forgery_protection_token,
      'csrf-token' => form_authenticity_token
    }
  end
end