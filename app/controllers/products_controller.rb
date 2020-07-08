class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:order] && params[:option]

      @sort_order = params[:order]

      @sort_option = 'ASC'
      @sort_option = 'DESC' if params[:option] == 'ASC'

      @products = Product.order({ @sort_order => @sort_option })
    else
      @products = Product.all
    end

  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
    @issues_ids = params[:ids]
  end

  def create
    @product = Product.new(product_params)
    @product.production_date = Date.current

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        if params[:is_issue_form]
          redirect_to issue_path(@product.issue_id)
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
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
    params.require(:product).permit(:name, :price, :number_count, :issue_id)
  end
end
