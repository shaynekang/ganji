# encoding: UTF-8
require 'sinatra'
require './lib/ganji/generator'

get '/' do
  erb :index
end

post '/generate' do
  calendar_type = params[:calendar_type].to_sym

  from, to = case calendar_type
             when :solar
               [Date.solar("#{params[:from]}-01-01"), Date.solar("#{params[:to]}-12-31")]
             when :lunar
               [Date.lunar("#{params[:from]}-01-01"), Date.lunar("#{params[:to]}-12-29")]
             end


  default_folder = "./tmp"
  File.directory?(default_folder) || Dir.mkdir(default_folder)

  filename = "#{default_folder}/excel_file.xls"

  generator = Ganji::Generator.new(calendar_type: calendar_type)
  generator.generate(from, to, filename)

  send_file(filename, :filename => "ganji.xls", :type => "application/octet-stream")
end