class Admin::BaseController < ApplicationController

  before_action :current_admin

  private

  def current_admin
    render_404 if current_user.admin?    
  end

end
