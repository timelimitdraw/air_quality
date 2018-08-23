class AddCsvAttachmentFormattedAddressToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :csv_attachment_formatted_address, :string
  end
end
