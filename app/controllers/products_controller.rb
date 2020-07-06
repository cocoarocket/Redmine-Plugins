class ProductsController < ApplicationController

  def index
    @issues = Issue.all

    if params[:order]
      @option = params[:option]
      @products = Product.order(params[:order].to_sym @option.to_sym)
    else
      @products = Product.all
    end

  end

  def new
    @issue
  end

  def create
  end

  def sort

  end
end
