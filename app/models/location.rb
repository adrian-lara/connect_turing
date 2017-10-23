class Location < ApplicationRecord

  def self.alphabetical
    order(:description)
  end

end
