module Ganji
  class Sheet
    Spreadsheet.client_encoding = 'UTF-8'

    def initialize
      @book = Spreadsheet::Workbook.new
    end

    def insert(date)
      sheet = find_or_create_sheet(date)

      row = date.day - 1
      column = date.month - 1

      sheet[row, column] = date.ganji
    end

    def write(filename)
      @book.write filename
    end

  private
    def find_or_create_sheet(date)
      sheet_name = date.year.to_s
      @book.worksheet(sheet_name) || @book.create_worksheet(name: sheet_name)
    end
  end
end