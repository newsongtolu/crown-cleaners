module Admin
  class SiteSettingsController < BaseController
    def index
      @site_settings = SiteSetting.all.order(:key)
    end

    def update
      setting = SiteSetting.find(params[:id])
      if setting.update(setting_params)
        redirect_to admin_site_settings_path, notice: "Setting '#{setting.key}' updated successfully."
      else
        redirect_to admin_site_settings_path, alert: "Failed to update setting."
      end
    end

    private

    def setting_params
      params.require(:site_setting).permit(:value)
    end
  end
end