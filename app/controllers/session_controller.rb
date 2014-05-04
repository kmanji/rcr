class SessionController < Devise::SessionsController
	
	before_filter :update_sanitized_params
	skip_before_filter :authenticate_user!, :only => :create
	respond_to :html, :json
	
	def update_sanitized_params
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation)}
	end

	# GET /resource/sign_in
	def new
		redirect_to :root
	end


	# POST /resource/sign_in
	def create
		user = User.find_by_username(params[:user][:username])
		email = User.find_by_email(params[:user][:email])
		if user.present? && user.valid_password?(params[:user][:password])
			sign_in(resource_name, user)
			render :json => {message: "ok"}
		elsif email.present? && email.valid_password?(params[:user][:password])
			sign_in(resource_name, email)
			render :json => {message: "ok"}
		else
			render :json => {message: "not ok"}
		end

		# self.resource = warden.authenticate!(auth_options)
		# set_flash_message(:notice, :signed_in) if is_flashing_format?
		# sign_in(resource_name, resource)
		# yield resource if block_given?
		# respond_with resource, location: after_sign_in_path_for(resource)
	end

end