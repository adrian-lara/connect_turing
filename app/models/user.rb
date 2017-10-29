class User < ApplicationRecord

  has_secure_password

  validates_presence_of :name, :username

  belongs_to :location

  has_many :mentee_associations, foreign_key: :mentor_id, class_name: "MentorMentee"
  has_many :mentees, through: :mentee_associations, source: :mentee

  has_many :mentor_associations, foreign_key: :mentee_id, class_name: "MentorMentee"
  has_many :mentors, through: :mentor_associations, source: :mentor

  enum role: ["default", "admin"]

  def last_active
    return updated_at if last_login.nil?
    last_login
  end

  def accepted_mentors
    accepted_mentor_ids = mentor_associations.where(status: "Accepted").pluck(:mentor_id)
    mentors.where(id: accepted_mentor_ids)
  end

  def accepted_mentees
    accepted_mentee_ids = mentee_associations.where(status: "Accepted").pluck(:mentee_id)
    mentees.where(id: accepted_mentee_ids)
  end

  def requested_mentors
    requested_mentor_ids = mentor_associations.where(status: "Requested").pluck(:mentor_id)
    mentors.where(id: requested_mentor_ids)
  end

  def requested_mentees
    requested_mentee_ids = mentee_associations.where(status: "Requested").pluck(:mentee_id)
    mentees.where(id: requested_mentee_ids)
  end

end
