class Api::V1::ProductsController < ProductsController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def create
    save_params = product_params
    @product = Product.new(save_params)
    @product.tag_list = params[:tags].join(", ")
    @product.categories_list = params[:categories].join(", ")
    @product.images_list = params[:images]
    respond_to do |format|
      if @product.save
        format.json
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product.tag_list = params[:tags].join(", ")
    @product.categories_list = params[:categories].join(", ")
    @product.images_list = params[:images]
    respond_to do |format|
      if @product.save
        format.json
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      if @product
        format.json
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def product_params
    params.permit(:name, :expiry_date, :price, :sku_id, :images, :categories, :tags, :images_attributes => [:img_path])
  end
end