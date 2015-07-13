class MoreDetail < ActiveRecord::Base
  
  has_attached_file :pic ,:styles => {:small => "150x150>"}
                          #:url => "/assets/products/:id/:style/:basename.:extension",
                          #:path => ":rails_root/public/assets/products/:id/:style/:basenam.:extension"

#  validates_attachment_presence :pic
#  validates_attachment_size :pic ,:less_than => 5.megabytes
   #validates_attachment_content_type :pic ,:content_type => ['image/jpeg', 'image/png']

   
end
