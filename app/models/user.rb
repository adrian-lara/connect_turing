class User < ApplicationRecord

  def last_active
    return updated_at if last_login.nil?
    last_login
  end

end
