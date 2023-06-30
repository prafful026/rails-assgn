class Hormone < ApplicationRecord
  before_validation :downcase_fields

  has_many :strip_batch_hormones
  has_many :strip_batches, through: :strip_batch_hormones
  has_many :test_hormones
  has_many :tests, through: :test_hormones

  validates :name, uniqueness: true ,presence: true, length: { minimum: 2, maximum: 20 }

  def downcase_fields
    self.name.downcase!
  end
end