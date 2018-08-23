class AddCsvAttachmentLongitudeToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :csv_attachment_longitude, :float
  end
end
