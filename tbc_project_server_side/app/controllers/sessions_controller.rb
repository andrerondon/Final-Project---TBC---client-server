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
      redirect_to products_path
    else
      flash[:warning] = "Couldn't log In"
      flash[:secondary] = "yikes"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to product_path
  end

  # Cart with itens

  def cart
    if session[:cart_items] == nil 
      session[:cart_items] = []
    else
      cart_items = session[:cart_items]
      cart_items << params[:id]
      session[:cart_items] = cart_items
    end
    products = Product.where(id: cart_items)

    render :cart
  end




end
