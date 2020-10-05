class Content < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze
  ALLOWED_TAGS = %w[Accueil Projet Animations Parrainage Entreprises Produits Bien-être Volontariat 'Sans rubrique'].freeze

  belongs_to :user

  has_one_attached :image
  has_one_attached :image800x800
  has_many_attached :file
  has_many :content_tag, dependent: :destroy
  has_many :tags, through: :content_tag

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
