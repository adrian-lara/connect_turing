class AddGenderPronounToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender_pronoun, :string
  end
end
