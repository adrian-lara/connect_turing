class Admin::BaseController < ApplicationController

  before_action :admin_check

  private

  def admin_check
    render_404 unless current_admin?
  end

end
