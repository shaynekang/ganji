require './lib/ganji/workbook'
require './lib/ruby_extensions/date'

module Ganji
  class Generator
    def generate(from, to, filename)
      book = make_workbook

      (from..to).each do |date|
        sheet = date.year
        row = date.day - 1
        column = date.month - 1

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
