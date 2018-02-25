module ProductsHelper
  
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
