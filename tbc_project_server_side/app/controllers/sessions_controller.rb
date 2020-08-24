class SessionsController < ApplicationController

  def new
 
  end

  def create
    user = User.find_by_email params[:email]
    # has_secure_password gives us the instance method authenticate used to check passwords
    # user& is a little bit of meta-programming. This basically checks if user is NOT nil before trying to call .authenticate. This is to avoid no method errors.
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      session[:color] = 'blue'
      # session is a hash that is available anywhere. Rails will grab all the informtion from session and create a cookie wiht the data.
      # A cookie is just a string of key value pairs
      # { session: {user_id: 384, color: 'blue'} }
      flash[:success] = "User Logged In"
      redirect_to product_path
    else
      flash[:warning] = "Couldn't log In"
      flash[:secondary] = "yikes"
      # flash[:dasfdsfadsfsd] = 'adsfads'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to product_path
  end

  # def create
  #   user = User.find_by(email: params[:email])
  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     render json: { id: user.id }
  #   else
  #     render json: { message: "you failed to log in" }, status: 404
  #   end
  #   session = Session.new session_params
     
  # end

  # def destroy 
  #   session[:user_id] = null;
  #   # session[:user_id] = nil;
  #   render product_path
  # end


end
