class PReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
  end
  
  def show
  end
  
  def new
    @review = PReview.new
  end
  
  def create
    @review = PReview.new(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.product, notice: 'Thanks for leaving a review.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
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
      @review = PReview.find(params[:id])
    end
  
    def review_params
      params.require(:p_review).permit(:product_id, :rating, :headline, :content)
    end
  
end
