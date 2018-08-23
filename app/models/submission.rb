require 'open-uri'
class Submission < ApplicationRecord
  before_validation :geocode_csv_attachment

  def geocode_csv_attachment
    if self.csv_attachment.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.csv_attachment)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.csv_attachment_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.csv_attachment_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.csv_attachment_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  # Indirect associations

  # Validations

end
