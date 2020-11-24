module Admin::V1
  class CouponsController < ApiController
    before_action :set_coupon, only: [:update, :destroy]
    
    def index
      @coupons = Coupon.all
    end

    def create
      @coupon = Coupon.new(coupon_params)
      save_coupon!
    end

    def update
      @coupon.attributes = coupon_params
      save_coupon!
    end

    def destroy
      @coupon.destroy!
    rescue
      render_error(fields: @coupon.errors.message)
    end

    private

    def coupon_params
      return {} unless params.has_key?(:coupon)
      params.require(:coupon).permit(:code, :status, :due_date, :discount_value)
    end

    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def save_coupon!
      @coupon.save!
      render :show
    rescue
      render_error(fields: @coupon.errors.messages)
    end
  end
end
