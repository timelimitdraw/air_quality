class AddCsvAttachmentLatitudeToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :csv_attachment_latitude, :float
  end
end
