module Admin::V1
  class CategoriesController < ApiController
    before_action :set_category, only: [:show, :update, :destroy]

    def index
      @loading_service = Admin::ModelLoadingService.new(Category.all, searchable_params)
      @loading_service.call
    end

    def show; end

    def create
      @category = Category.new(category_params)
      save_category!
    end

    def update
      @category.attributes = category_params
      save_category!
    end

    def destroy
      @category.destroy!
    rescue
      render_error(fields: @category.errors.message)
    end

    private
      def category_params
        return {} unless params.has_key?(:category)
        params.require(:category).permit(:name)
      end

      def set_category
        @category = Category.find(params[:id])
      end

      def save_category!
        @category.save!
        render :show
      rescue
        render_error(fields: @category.errors.messages)
      end

      def load_category
        @category = category.find(params[:id])
      end

      def searchable_params
        params.permit({search: :name}, {order: {}}, :page, :length)
      end
  end
end
