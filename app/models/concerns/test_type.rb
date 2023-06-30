module TestType
  extend ActiveSupport::Concern
  included do
    enum test_type: { pregnancy: 0, ovulation: 1 }
  end
end