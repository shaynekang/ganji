# encoding: UTF-8
require 'spreadsheet'

module Spreadsheet
  class Worksheet
    def copy(from)
      @rows = from.rows.dup
      @columns = from.columns.dup
    end
  end
end

module Ganji
  class WorkBook
    Spreadsheet.client_encoding = 'UTF-8'

    def initialize
      @book = Spreadsheet::Workbook.new
    end

    def insert(sheet_name, row, column, value)
      sheet = find_or_create_sheet(sheet_name)

      row += 2
      column += 2

      sheet[row, column] = value
    end

    def write(filename)
      @book.write filename
    end

  private
    def find_or_create_sheet(sheet_name)
      sheet_name = sheet_name.to_s
      sheet = @book.worksheet(sheet_name)
      unless sheet
        sheet = @book.create_worksheet(name: sheet_name)
        make_style(sheet, sheet_name)
      end
      sheet
    end

    def make_style(sheet, sheet_name)
      bold = Spreadsheet::Format.new(weight: :bold)

      sheet[0, 0] = sheet_name + "년"
      sheet.row(0).set_format(0, bold)

      sheet[0, 2] = "월"
      sheet.row(0).set_format(2, bold)

      1.upto(12) do |month|
        row = 1
        column = month + 1

        sheet[row, column] = month.to_s
        sheet.row(row).set_format(column, bold)
      end

      sheet[2, 0] = "일"
      sheet.row(2).set_format(0, bold)

      1.upto(31) do |day|
        row = day + 1
        column = 1

        sheet[row, column] = day.to_s
        sheet.row(row).set_format(column, bold)
      end
    end
  end
end