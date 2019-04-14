require "csv"

module Export
  class ToCsvService
    def initialize objects, attributes
      @attributes = attributes
      @objects = objects
    end
  
    def perform
      CSV.generate(options) do |csv|
        csv << attributes
        @objects.each do |object|
          csv << object.attributes.values
        end
      end
    end
  
    private
    attr_reader :attributes, :objects
  end
end
