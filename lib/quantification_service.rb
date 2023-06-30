module QuantificationService

  class QuantificationServiceError < StandardError
    attr_reader :error

    def initialize(e)
      @error = e
    end
  end

  def self.invoke(params)
    begin
      {
        LH: {
          od_value: 1,
          concentration: 1
        },
        PDG: {
          od_value: 11,
          concentration: 21
        },
        ABC: {
          od_value: 111,
          concentration: 121
        },
        XYZ: {
          od_value: 111,
          concentration: 121
        }
      }
    rescue StandardError => e
      raise QuantificationServiceError.new(e)
    end
  end
end