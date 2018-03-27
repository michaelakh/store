class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :preview, :edit, :update, :destroy]
  before_action :set_product_info, only: [:show, :preview]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(live: true)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = PReview.all.sort_by(&:created_at)
  end
  
  def preview
    
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.product_infos.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        # Set notice and redirect to preview after saved
        flash[:notice] = 'Product has been saved.'
        format.html { redirect_to controller:"products", action: "preview", id: @product.id }
        format.json { render :preview, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
      
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        # Set notice and redirect to preview after saved
        flash[:notice] = 'Product has been saved.'
        format.html { redirect_to controller:"products", action: "preview", id: @product.id }
        format.json { render :preview, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def live
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @product.update_attributes(live:true)
        flash[:notice] = "Product is now live"
        format.html { redirect_to @product, notice: 'Product is Live' }
        format.json { render :show, status: :ok, location: @product }
      else
        flash[:notice] = "There was an error saving your product"
        format.html { render :preview }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
  
    def set_product_info
      @product_info = ProductInfo.find_by(product_id:@product.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :details, :description, :price, :rrp, :stock, :category, :brand, :photo, product_infos_attributes: [:id,:product_id, :product_dimensions, :item_model_number, :volume, :volume_units, :storage_instructions, :country_of_origin, :primary_ingredient_origin, :format, :speciality, :certification, :caffeine, :awards, :manufacturer, :important_info, :manufacturer_info]) 
    end
end
