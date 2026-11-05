class SitemapsController < ApplicationController
  def show
    @services = Service.all
    respond_to do |format|
      format.xml
    end
  end
end