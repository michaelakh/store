class PReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
  end
  
  def show
  end
  
  def new
    @review = PReview.new
  end
  
  def create
     @review = Coupon.new(review_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def set_review
      @review = Product.find(params[:id])
    end
  
    def review_params
      params.require(:preview).permit(:product_id, :rating, :discount, :headline, :content)
    end
  
end
