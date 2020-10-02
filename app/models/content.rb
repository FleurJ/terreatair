class Content < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze
  ALLOWED_TAGS = %w[Accueil blog unreferenced Bien-être].freeze

  belongs_to :user

  has_one_attached :image
  has_many_attached :file

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
  validates :tags, presence: true, inclusion: { in: ALLOWED_TAGS,
                                                message: "%{value n'est pas un statut valide" }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
