require_relative './filters'

module Legco
  module Handsard
    class Parser
      attr_accessor :filters

      def initialize
        @filters = []
        @filters << Filters::CleanupFilter.new
        @filters << Filters::AttendeeFilter.new
      end

      def parse(document)
        @filters.each do |filter|
          filter.process(document)
        end
        document
      end
    end
  end
end