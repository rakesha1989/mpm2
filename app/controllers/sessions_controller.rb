class SessionsController < Devise::SessionsController

	private

	def sign_in_params
		params.require(:user).permit(:name, :email, :password)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
	end

end