module Admin::V1
  class ProductsController < ApiController
    before_action :set_product, only: [:update, :destroy]

    def index
      @products = Product.all
    end

    def create
      @product = Product.new(product_params)
      save_product!
    end

    def update
      @product.attributes = product_params
      save_product!
    end

    def destroy
      @product.destroy!
    rescue
      render_error(fields: @product.errors.message)
    end

    private
      def product_params
        return {} unless params.has_key?(:product)
        params.require(:product).permit(:name, :description, :price, :productable_type, :productable_id)
      end

      def set_product
        @product = Product.find(params[:id])
      end

      def save_product!
        @product.save!
        render :show
      rescue
        render_error(fields: @product.errors.messages)
      end
  end
end
