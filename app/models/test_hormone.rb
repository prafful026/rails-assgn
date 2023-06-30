class TestHormone < ApplicationRecord
  belongs_to :test
  belongs_to :hormone
  validates :concentration, presence: true
  validates :od_value, presence: true
end