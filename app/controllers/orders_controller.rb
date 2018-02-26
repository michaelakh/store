class OrdersController < ApplicationController
  
  def cart
    if params[:product] == nil
      
    else
      if params[:product][:qty] == nil || params[:product][:item] == nil
        redirect_to products_path, notice: 'Please select an Item before going to checkout'
      end
        add_item_to_cart
    end
  end
  
  def delivery
    @user = User.find(current_user.id)
    @test = update_items
  end
  
  def dispatch_method
    @user_ad = current_user.addresses.find(params[:address_id])
    
    product_id = []
    
    session[:cart].each do |x|
      product_id << x['item'].to_i
    end
    
    @product = Product.find(product_id)
  end
  
  def pay
  end
  
  def confirm
    
  end
  
  def process_order
    redirect_to confirm_handler_order_path(address_id:params[:address_id], delivery:params[:delivery])
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
  
  protected
  
  def order_params
    params.require(:order).permit(:product_id,:user_id,:qty,:price) 
  end
  
  def add_item_to_cart 
    result = params[:product].permit(:qty,:item).to_h
    
    if session[:cart] == nil
      session_r = []
      items = (session_r << result).compact
      session[:cart] = items.compact
      
    else
      session[:cart].each do |x|
        @processed = false
        if x['item'] == params[:product][:item]
          x['qty'] = params[:product][:qty]
          @processed = true
          break
        end
      end
      if @processed == false
        session_r = session[:cart]
        items = (session_r << result).compact
      end
    end
    
    session[:cart]
  end
  
  def update_items
    session[:cart].each do |v,k|
      v['qty'] = params[:product][v['item']]['qty']
    end
  end
  
  def remove_item_from_cart
    session[:cart] = nil
  end
  
  def cart_count
    if (session[:cart] && session[:cart].empty? != true)
        session[:cart].inspect
    else
        0
    end
  end
end