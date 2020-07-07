class ProductsController < ApplicationController
  before_action :find_issues, only: [:edit, :update]
  default_search_scope :issues

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :find_issue, :only => [:show, :edit, :update, :issue_tab]

  def index

    if params[:order]
      @option = params[:option]
      @products = Product.order(params[:order].to_sym @option.to_sym)
    else
      @products = Product.all
    end

  end

  def new
    @product = Product.new
  end

  def edit
    @issues_ids = params[:ids]
  end

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

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:side, :shadow, :light)
  end
end
