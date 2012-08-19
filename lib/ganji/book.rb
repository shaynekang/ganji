require 'spreadsheet'

module Ganji
  class Book
    Spreadsheet.client_encoding = 'UTF-8'

    def initialize
      @book = Spreadsheet::Workbook.new
    end

    def insert(sheet_name, row, column, value)
      sheet = find_or_create_sheet(sheet_name)
      sheet[row, column] = value
    end

    def write(filename)
      @book.write filename
    end

  private
    def find_or_create_sheet(sheet)
      sheet = sheet.to_s
      @book.worksheet(sheet) || @book.create_worksheet(name: sheet)
    end
  end
end