class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_main_domain if Rails.env.production?
  def redirect_main_domain
    dominio = 'ubuntufeed.co'
    if request.env['HTTP_HOST'] != dominio
      redirect_to "http://#{dominio}#{request.fullpath}"
    end
  end
end
