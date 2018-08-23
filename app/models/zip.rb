class Zip < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :zip_code, :presence => { :message => "You must input a zip code" }

  validates :zip_code, :numericality => { :greater_than => 0 }

  validates :zip_code, :length => { :minimum => 5, :maximum => 5 }

end
