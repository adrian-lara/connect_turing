class User < ApplicationRecord

  validates_presence_of :name

  belongs_to :location

  has_many :mentees, { through: :mentor_mentees, foreign_key: :mentor_id, class_name: "User" }
  has_many :mentors, { through: :mentor_mentees, foreign_key: :mentee_id, class_name: "User" }

  def last_active
    return updated_at if last_login.nil?
    last_login
  end

end
