class ProductsController < ApplicationController
    class Api::V1::ProductsController < ApplicationController
        def index
            products = Product.order(created_at: :desc)
            render products
          end
        
          def show
            product = Product.find params[:id]
            render products
          end
        
          def create
            product = Product.new params.require(:product).permit(:name, :category, :description, :price, :img_url )
            if products.save
              render json: { id: products.id }
            else
              render root_path
            end
          end
    
          def update
            if product.update product_params
              render 
            else
              render(
                json: { errors: product.errors },
                status: 422 # Unprocessable Entity
              )
            end
          end
    
          def destroy
            product.destroy
            render(json: { status: 200 }, status: 200)
          end
    end
    
    
end
