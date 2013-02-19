class ApplicationController < ActionController::Base
  protect_from_forgery
  # En lo que compro un dominio cancelo la redirección
  # before_filter :redirect_main_domain if Rails.env.production?
  # def redirect_main_domain
  #   dominio = 'ubuntufeed.tk'
  #   if request.env['HTTP_HOST'] != dominio
  #     redirect_to "http://#{dominio}#{request.fullpath}"
  #   end
  # end
end
