class ProductsController < ApplicationController
    
          def index
            @products = Product.all.order('updated_at DESC')
          end


          # ALL BELLOWS TO ONLY ADMIN

          def new
            @product = Product.new
            render :new   
          end
        
          def create
            @product = Product.new params.require(:product).permit(:name, :category, :description, :price, :img_url)
            if @product.save
              redirect_to product_path(@product)
            else
              render :new
            end
          end

          def show
            id = params[:id]
            @product = Product.find(id)
            # @order = Order.new
            # @orders = @product.orders.order(created_at: :desc)
          end
      
          def update
              id = params[:id]
              @product = Product.find(id)
              if @product.update(params.require(:product).permit(:name, :category, :description, :price, :img_url))
                redirect_to product_path(@product)
              else
                render :edit
              end
          end
    
          def destroy
              id = params[:id]
              @product = Product.find(id)
              @product.destroy
              render :new
              if @product.destroy
                flash[:warning] = "this product has been deleted"
              else
                flash[:warning] = "this product wasn't deleted"
              end
          end
  
    
    
end
