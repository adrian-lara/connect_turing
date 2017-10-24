class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user

  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end
end
