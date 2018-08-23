class Zip < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :zip_code, :numericality => { :greater_than => 0 }

  validates :zip_code, :length => { :minimum => 5, :maximum => 5 }

end
