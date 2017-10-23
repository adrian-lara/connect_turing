class MentorMentee < ApplicationRecord
  belongs_to :user, foreign_key: :mentor_id
  belongs_to :user, foreign_key: :mentee_id
end
