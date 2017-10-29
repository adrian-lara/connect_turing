class AddStatusToMentorMentee < ActiveRecord::Migration[5.1]
  def change
    add_column :mentor_mentees, :status, :integer
  end
end
