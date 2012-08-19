# encoding: UTF-8
require 'sinatra'
require './lib/ganji/generator'

get '/' do
  from = Date.parse("#{params[:from]}-01-01")
  to = Date.parse("#{params[:to]}-12-31")

  default_folder = "./tmp"
  File.directory?(default_folder) || Dir.mkdir(default_folder)

  filename = "#{default_folder}/excel_file.xls"

  generator = Ganji::Generator.new
  generator.generate(from, to, filename)

  send_file(filename, :filename => "ganji.xls", :type => "application/octet-stream")
end