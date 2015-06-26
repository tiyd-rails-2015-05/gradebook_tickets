class Grade < ActiveRecord::Base
  has_attached_file :upload_pdf
  validates_attachment_content_type :upload_pdf, :content_type => /.*/
  belongs_to :assignment
  belongs_to :student

end
