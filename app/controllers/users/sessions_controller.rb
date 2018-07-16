class Users::SessionsController < Devise::SessionsController
  skip_before_action :jwt_auth_validation, only: [:create, :destroy]

  def create 
    
    if params[:email] && params[:password]
      user = User.find_by(email: params[:email])

      if user.confirmed?
        if user && user.valid_password?(params[:password])
          payload = {
            user_id: user.id,
            token_type: 'client_a2',
            exp: 4.hours.from_now.to_i,
          }
          @jwt_token = jwt_encode(payload)

          render json: { token: @jwt_token }, status: 200
        else
          render json: { error: 'Wrong email or password, please make sure if your caps lock has been pressed or if email is correct and try again.' }, status: :unauthorized
        end
      else
        render json: { error: 'Please confirm your email before sign in.' }, status: :unauthorized
      end

    else
      render json: { error: 'Missing necessary params.' }, status: :unauthorized
    end

  end
end