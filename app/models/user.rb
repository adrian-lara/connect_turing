class User < ApplicationRecord

  validates_presence_of :name

  belongs_to :location

  has_many :mentee_list, foreign_key: :mentor_id, class_name: "MentorMentee"
  has_many :mentees, through: :mentee_list, source: :mentee

  has_many :mentor_list, foreign_key: :mentee_id, class_name: "MentorMentee"
  has_many :mentors, through: :mentor_list, source: :mentor

  def last_active
    return updated_at if last_login.nil?
    last_login
  end

end
