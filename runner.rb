# encoding: UTF-8
require './lib/ganji/generator'

from = Date.parse("2010-01-01")
to = Date.parse("2012-12-31")

default_folder = "./tmp"
File.directory?(default_folder) || Dir.mkdir(default_folder)

filename = "#{default_folder}/excel_file.xls"

generator = Ganji::Generator.new
generator.generate(from, to, filename)


