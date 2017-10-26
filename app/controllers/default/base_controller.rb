class Default::BaseController < ApplicationController

  before_action :default_check

  def default_check
    render_404 unless current_default?
  end

end
