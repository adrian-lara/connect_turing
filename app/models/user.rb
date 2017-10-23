class User < ApplicationRecord

  validates_presence_of :name

  belongs_to :location

  def last_active
    return updated_at if last_login.nil?
    last_login
  end

end
