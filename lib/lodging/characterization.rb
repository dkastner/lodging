module BrighterPlanet
  module Lodging
    module Characterization
      def self.included(base)
        base.characterize do
          has :lodging_class
          has :zip_code
          has :state
          has :rooms
          has :duration
        end
      end
    end
  end
end
