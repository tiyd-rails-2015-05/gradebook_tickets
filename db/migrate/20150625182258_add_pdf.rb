class AddPdf < ActiveRecord::Migration
  def change
    add_attachment :grades, :upload_pdf
  end
end
