class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :slack
      t.string :email
      t.string :looking_for
      t.text :about_me
      t.text :availability_notes
      t.datetime :last_login

      t.timestamps
    end
  end
end
