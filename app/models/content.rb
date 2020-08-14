class Content < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze
  ALLOWED_TAGS = %w[home blog unreferenced].freeze

  belongs_to :user

  has_many_attached :image
  has_many_attached :file

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
  validates :tags, presence: true, inclusion: { in: ALLOWED_TAGS,
                                                message: "%{value n'est pas un statut valide" }
end
