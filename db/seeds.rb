# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

class Seed

  def self.locations
    CSV.foreach('db/csv/linkedin_locations.csv', headers: true) do |row|
      Location.create(description: row["Description"])
    end
  end

  def self.first_admin
    User.create(name: "Adrian Lara",
                                slack: "adrian-lara",
                                password: "password",
                                username: "adrian-lara",
                                role: 1,
                                location_id: 1
                                )
  end

end

Seed.locations
Seed.first_admin
