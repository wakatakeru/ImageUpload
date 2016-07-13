class Image < ActiveRecord::Base
  validates :title,
            presence: true
end
