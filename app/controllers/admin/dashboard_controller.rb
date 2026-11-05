module Admin
  class DashboardController < BaseController
    def index
      @services_count = Service.count
      @enquiries_count = defined?(Enquiry) ? Enquiry.count : 0
      @site_settings_count = defined?(SiteSetting) ? SiteSetting.count : 0
      @recent_enquiries = defined?(Enquiry) ? Enquiry.order(created_at: :desc).limit(5) : []
    end
  end
end