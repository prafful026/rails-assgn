class StripBatch < ApplicationRecord
  include TestType

  before_save :downcase_fields
  before_create :create_strips

  has_many :strips
  has_many :strip_batch_hormones
  has_many :hormones, through: :strip_batch_hormones

  validates :manufacturer, presence: true
  validates :test_type, inclusion: { in: test_types.keys, message: :invalid }
  validates :batch_size, presence: true, inclusion: 1..99999
  validates :mfd, presence: true
  validates :expd, presence: true
  validate :one_hormone_at_least
  validate :validate_date

  private

  def validate_date
    unless expd > Date.current && expd > mfd
      errors.add(:expd, "Invalid date")
      errors.add(:mfd, "Invalid date")
    end
  end

  def downcase_fields
    self.manufacturer.downcase!
  end

  def one_hormone_at_least
    if self.hormones.empty?
      errors.add(:hormones, "Need at least one hormone")
    end
  end

  def create_strips
    batch_size.times do
      self.strips << Strip.new
    end
  end
end