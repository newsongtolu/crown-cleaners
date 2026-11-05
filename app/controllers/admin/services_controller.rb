module Admin
  class ServicesController < BaseController
    before_action :set_service, only: [:edit, :update]

    def index
      @services = Service.order(:position)
    end

    def edit
    end

    def update
      if @service.update(service_params)
        redirect_to admin_services_path, notice: "Service '#{@service.title}' updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :slug, :description, :icon, :image_url, :active, :position)
    end
  end
end