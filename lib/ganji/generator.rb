require './lib/ganji/book'
require './lib/ruby_extensions/date'

module Ganji
  class Generator
    def generate(from, to, filename)
      book = make_book

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
    def make_book
      Book.new
    end
  end
end
