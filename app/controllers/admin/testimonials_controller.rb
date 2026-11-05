module Admin
  class TestimonialsController < BaseController
    before_action :set_testimonial, only: [:edit, :update, :destroy]

    def index
      @testimonials = Testimonial.order(:position, :created_at)
    end

    def new
      @testimonial = Testimonial.new(active: true, rating: 5)
    end

    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        redirect_to admin_testimonials_path, notice: "Testimonial successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @testimonial.update(testimonial_params)
        redirect_to admin_testimonials_path, notice: "Testimonial successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @testimonial.destroy
      redirect_to admin_testimonials_path, notice: "Testimonial deleted."
    end

    private

    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial).permit(:quote, :author_title, :company_or_location, :rating, :position, :active)
    end
  end
end