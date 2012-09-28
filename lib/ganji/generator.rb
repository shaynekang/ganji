require './lib/ganji/workbook'
require './lib/ruby_extensions/date'

module Ganji
  class Generator
    def initialize(opts={})
      @opts = {calendar_type: :solar}.merge(opts)
    end

    def generate(from, to, filename)
      book = make_workbook

      (from..to).each do |date|
        converted = case @opts[:calendar_type]
               when :solar
                 date.to_solar
               when :lunar
                 date.to_lunar
               end

        next unless converted

        year, month, day = converted.split('-')

        sheet = year.to_i
        row = day.to_i - 1
        column = month.to_i - 1

        ganji = date.ganji

        book.insert(sheet, row, column, ganji)
      end

      book.write filename
    end

  private
    def make_workbook
      WorkBook.new
    end
  end
end
