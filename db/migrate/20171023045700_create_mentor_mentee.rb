class CreateMentorMentee < ActiveRecord::Migration[5.1]
  def change
    create_table :mentor_mentees do |t|
      t.bigint :mentor_id, index: true
      t.bigint :mentee_id, index: true

      t.timestamps
    end
  end
end
