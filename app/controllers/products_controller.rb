class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  # def index
  #   @products = Product.limit(3)
  #   # @test_variable =42
  # end
  respond_to :json, :html
  
  def index
    if params[:q]
      search_term = params[:q]
      p @products = Product.where("name LIKE ?", "%#{search_term}%") # return our filtered list here
    else
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    end
     respond_with @products
  end

 # GET /products/1
# GET /products/1.json
def show
  @comments = @product.comments.order("created_at DESC")
end

  # GET /products/new
  def new
    @product = Product.new
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
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
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
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
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
  
  def landing_page
      @featured_product = Product.first
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
  
    
    
    
    def set_user
      @user = current_user
    end
    
    
    
    
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
