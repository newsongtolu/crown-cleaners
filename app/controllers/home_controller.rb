class HomeController < ApplicationController
  def index
    @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}
    @services = Service.where(active: true).order(:position) rescue []
    @testimonials = Testimonial.where(active: true).order(:position) rescue []
    @enquiry = Enquiry.new
  end

  def show_service
    @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}
    @service = Service.find_by(id: params[:id]) || Service.first
    @services = Service.where(active: true).order(:position) rescue []
    @enquiry = Enquiry.new
  end

  def create_enquiry
    # Honeypot spam defense check: if bot fills out the hidden field, fake success silently
    if params[:website_hp].present?
      redirect_to root_path, notice: "Thank you! Your cleaning enquiry has been submitted." and return
    end

    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to root_path, notice: "Thank you! Your cleaning enquiry has been submitted. Our team will contact you shortly."
    else
      @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}
      @services = Service.where(active: true).order(:position) rescue []
      @testimonials = Testimonial.where(active: true).order(:position) rescue []
      render :index, status: :unprocessable_entity
    end
  end

  def privacy; @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}; end
  def cookies_policy; @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}; end
  def terms; @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}; end
  def accessibility; @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}; end
  def safeguarding; @site_settings = SiteSetting.pluck(:key, :value).to_h rescue {}; end

  private

  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :phone, :service_type, :organization, :sector, :reply_preference, :message)
  end
end