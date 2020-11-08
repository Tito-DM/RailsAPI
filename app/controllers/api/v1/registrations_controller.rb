class Api::V1::RegistrationsController < Devise::RegistrationsController
before_action :ensure_params_exit, only: :create
def create

    user = User.new(user_params)
    if user.save
        render json: {
            message: "signed Up sucessfully",
            is_sucessful: true,
            data:{
                user: user
            },
            status: :ok
        }
    else
        render json: {
            message: "signed Up sucessfully",
            is_sucessful: false,
            data:{},
            status: :unprocessable_entity
        }
    end
end


private
 def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
 end
 
 def ensure_params_exit
    return if params[:user].present?
     render json: {
         message: "missing params", 
         is_sucessful: false,
         data:{},
         status: :bad_request}
 end


end