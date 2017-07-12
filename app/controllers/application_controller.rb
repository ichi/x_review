class ApplicationController < ActionController::Base
  include Devisable

  protect_from_forgery with: :exception
end
