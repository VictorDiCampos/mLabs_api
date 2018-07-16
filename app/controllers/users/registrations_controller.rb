class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :jwt_auth_validation, only: [:create]
  respond_to :json

  def create
    @user = User.new(sign_up_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end

  end

  private

    def sign_up_params
      params.permit(:name, :email, :cpf, :password)    
    end

end