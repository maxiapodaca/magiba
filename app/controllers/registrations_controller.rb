class RegistrationsController < Devise::RegistrationsController
	private 
	def sign_up_params
		params.require(:user).permit(:name, :apellido, :dni,:email, :localidad ,:telefono, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:name, :apellido , :email,:dni, :localidad ,:telefono ,:password, :password_confirmation, :current_password)
	end
end