class Strip < ApplicationRecord
  before_create :add_strip_code
  belongs_to :strip_batch
  has_one :test
  enum status: { active: 0, used: 1, damaged: 2 }
  validates :status, inclusion: { in: statuses.keys, message: :invalid }

  def self.get_validated_strip(strip_code, test_type)
    strip = self.find_by(code: strip_code)
    strip&.strip_batch&.test_type == test_type && strip.active? && strip.strip_batch.expd > Date.current && strip
  end

  private

  def add_strip_code
    self.code = SecureRandom.uuid
  end
end
