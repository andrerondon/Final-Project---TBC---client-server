class OrdersController < ApplicationController
    def index
        orders = Order.order_by(created_at: :desc)
        render orders
    end

    def show
        order = Order.find(params[:id])
        render order
    end

    def create
        order = Order.new params.require(:order).permit(:user_id, :address, :email)
        order.user = current_user
        if order.save
            render({ id: order.id })
          else
            render({ errors: order.errors },
              status: 422 
            )
          end
    end

    def destroy
        id = params[:id]
        order = Order.find(id)
        if order.destroy
            render({message: `order for user with id #{order.userId} has been deleted`})
        else
            render({errors: order.errors, message: `order for user with id #{order.userId} could not be deleted`},
                status: 422
            )
        end
    end


    def update
        id = params[:id]
        order = Order.find(id)
        if order.update(params.require(:order).permit(:user_id, :shipping_address, :email, :status))
          render json: order
        else
          render (json: {errors: order.errors, message: `order for user with id #{order.userId} could not be updated`})
        end
    end
end
