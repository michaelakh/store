class OrdersController < ApplicationController
  
  def new
    
  end
  
  def create
    
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
   def order_params
      params.require(:order).permit(:product_id,:user_id,:qty,:price) 
    end
end