# class ProductsController < ApplicationController
#   before_action :authenticate_user!, except: [:index, :show] 
#   before_action :authorize!, only: [:creat, :edit, :update, :destroy]

    
#           def index
#             @products = Product.all.order('updated_at DESC')
#           end


#           # ALL BELLOWS TO ONLY ADMIN

#           def new
#             @product = Product.new
#             render :new   
#           end
          
#           def create
#             @product = Product.new params.require(:product).permit(:name, :category, :description, :price, :img_url)
#             # @product.user = current_user # only loged in user will do that
#             if @product.save
#               redirect_to product_path(@product)
#             else
#               render :new
#             end
#           end

#           def show
#             id = params[:id]
#             @product = Product.find(id)
#             # @order = Order.new
#             # @orders = @product.orders.order(created_at: :desc)
#           end
      
#           def update
#               id = params[:id]
#               @product = Product.find(id)
#               @product.user = current_user # only loged in user will do that
#               if @product.update(params.require(:product).permit(:name, :category, :description, :price, :img_url))
#                 redirect_to product_path(@product)
#               else
#                 render :edit
#               end
#           end
#           # def update 
#           #   if @product.update product_params
#           #       redirect_to product_path(@product)
#           #   else 
#           #       render :edit 
#           #   end
#           # end
    
#           def destroy
#               id = params[:id]
#               # @product = Product.find_by(product_id: id)
#               @product = Product.find(id)
#               @product.user = current_user # only loged in user will do that
#               if user_signed_in?
#                 flash[:warning] = "You must login"
#               else
#                 flash[:warning] = "you are not allowed"
#               end
#               @product.destroy
#               render :new
#               if @product.destroy
#                 flash[:warning] = "this product has been deleted"
#               else
#                 flash[:warning] = "this product wasn't deleted"
#               end
#           end
  
    
    
# end


class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  # before_action :authorize!, only: [:creat, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :img_url, :description,)
    end
end

