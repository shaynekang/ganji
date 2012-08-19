require './lib/ruby_extensions/date'

module Ganji
  class Generator
    def generate(from, to, filename)
      sheet = Sheet.new

      (from..to).each do |date|
        sheet.insert(date)
      end

      sheet.write filename
    end
  end
end
