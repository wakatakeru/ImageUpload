class Image < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  validates :title,
            presence: true
end
