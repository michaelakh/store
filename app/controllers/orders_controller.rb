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
  
  def remove_cart_item
    session[:cart].each do |x| 
      if x['item'] == "#{params[:item]}"
        x['item'] = nil
      end
    end 
    session[:cart].reject! { |v| v['item'] == nil } 
    
    if session[:cart] == []
      session[:cart] = nil
    end
    flash[:success] = 'Item was removed from basket'
    redirect_to cart_order_path
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
    @products = Product.find( find_products )
    @address = Address.find(params[:address_id]) 
  end
  
  def process_order
    redirect_to confirm_handler_order_path(address_id:params[:address_id], delivery:params[:delivery])
  end
  
  def create_order
    update_items
    @products = Product.find( find_products )
    result = ''
    @price = 0
    session[:cart].each do |x|
      product = Product.find(x['item'])
      result += "#{x['item']},#{x['qty']},#{product.price}|"
      @price += product.price
    end
    @product_iqp = result.chop
    @address = Address.find(params[:address])
    #create slug with 5 random characters and 5 random integers for reference
    @reference = [*('A'..'Z')].shuffle[0,5].join + [*(1..9)].shuffle[0,5].join
    @order = Order.new(reference:@reference, product_iqp:@product_iqp, address_id:@address.id, user_id:current_user.id,delivery:params[:delivery],price:@price)
    
    respond_to do |format|
      if @order.save
        flash[:success] = 'Your order has been placed'
        remove_item_from_cart
        format.html { redirect_to :controller => "orders", :action => "show", :id => @order.id }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :order }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @order = Order.find(params[:id])
    @address = Address.find(@order.address_id)
    products = []
    @order_info = @order.product_iqp.split('|')
    
  end
  
  def edit
  end
  
  def update
    @address = Order.find(params[:id])
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
    if params[:product] != nil
        session[:cart].each do |v,k|
          v['qty'] = params[:product][v['item']]['qty']
        end
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
  
  def find_products
    result = []
    session[:cart].each do |x|
      if x['item'] != nil && x['qty'] != nil 
        result << x['item'].to_i
      end
    end
    result
  end
end