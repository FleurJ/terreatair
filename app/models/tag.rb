class Tag < ApplicationRecord
  has_many :content_tag, dependent: :destroy
  has_many :contents, through: :content_tags

  validates :title, presence: true
end
