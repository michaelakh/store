class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  before_action :authenticate_user!
  
  # GET /addresses/new
  def new
    @address = Address.new
  end
  
  def order
    update_items
    
    if set_address_where.present?
      redirect_to address_select_addresses_order_path
    end
    
    @address = Address.new
  end
  
  def order_address
    set_address_where
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to edit_user_registration_path, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_order
    params[:address][:user_id] = current_user.id
    params[:address][:town_city].capitalize!
    params[:address][:county].capitalize!
    params[:address][:postcode].upcase!
    
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to address_select_handler_order_url, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :order }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to address_select_handler_order_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end
    def set_address_where
      @address = Address.where(user_id:current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:id, :user_id, :full_name, :street_ad, :street_ad2, :postcode, :country, :town_city, :phone_no, :county)
    end
  
    def update_items
      if params[:product] != nil
        session[:cart].each do |v,k|
          v['qty'] = params[:product][v['item']]['qty']
        end
      end
    end
end
