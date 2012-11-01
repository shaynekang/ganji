# encoding: UTF-8
require 'sinatra'
require './lib/ganji/generator'

get '/' do
  erb :index
end

get '/en' do
  erb :index_en
end

def pase_date(from, to, type)
  case type.to_sym
  when :solar
    [Date.solar("#{from}-01-01"), Date.solar("#{to}-12-31")]
  when :lunar
    [Date.lunar("#{from}-01-01"), Date.lunar("#{to}-12-29")]
  end
end

post '/generate' do
  calendar_type = params[:calendar_type].to_sym
  from, to = pase_date(params[:from], params[:to], calendar_type)

  default_folder = "./tmp"
  File.directory?(default_folder) || Dir.mkdir(default_folder)

  filename = "#{default_folder}/excel_file.xls"

  generator = Ganji::Generator.new(calendar_type: calendar_type)
  generator.generate(from, to, filename)

  send_file(filename, :filename => "ganji.xls", :type => "application/octet-stream")
end