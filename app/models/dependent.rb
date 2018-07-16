class Dependent < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :kinship, presence: true
end
