class OrdersController < ApplicationController
    def index
        orders = Order.order_by(created_at: :desc)
        render orders
    end

    def show
        order = Order.all(params[:id])
        render :show
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
          flash[:warning] = "this order has been deleted"
        else
          flash[:warning] = "this order wasn't deleted"
        end
    end


    def update
        id = params[:id]
        order = Order.find(id)
        if order.update(params.require(:order).permit(:user_id, :shipping_address, :email, :status))
          render order
        else
          flash[:warning] = "this order could not be updated"
        end
    end

     

end
