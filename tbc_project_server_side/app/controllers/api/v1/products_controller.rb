class Api::V1::ProductsController < ApplicationController
    def index
        # curl http://localhost:3000/api/v1/
        products = Product.order(created_at: :desc)
        render json: products
      end
    
      def show
         # curl http://localhost:3000/api/v1/products/:id
        product = Product.find params[:id]
        render json: products
      end
    
      def create
        product = Product.new params.require(:product).permit(:name, :category, :description, :price, :img_url )
        if products.save
          render json: { id: products.id }
        else
          render json: { error: products.errors }
          status: 422 # unprocessable entitiy HTTP Status Code
        end
      end

      def update
        if product.update product_params
          render json: { id: product.id }
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

