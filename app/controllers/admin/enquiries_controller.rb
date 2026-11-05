module Admin
  class EnquiriesController < BaseController
    def index
      @enquiries = Enquiry.order(created_at: :desc)
    end

    def destroy
      @enquiry = Enquiry.find(params[:id])
      @enquiry.destroy
      redirect_to admin_enquiries_path, notice: "Enquiry successfully deleted."
    end
  end
end