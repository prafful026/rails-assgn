class Test < ApplicationRecord
  include TestType
  attr_accessor :strip_code
  after_create :change_strip_status
  belongs_to :user
  belongs_to :strip
  has_many :test_hormones
  has_many :hormones, through: :test_hormones
  validates :test_type, inclusion: { in: test_types.keys }

  private
  def change_strip_status
    strip.used!
  end
end