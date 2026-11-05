module Admin
  class BaseController < ApplicationController
    layout false
    before_action :authenticate_admin!
  end
end