require 'sinatra'
require_relative 'word_search'
get '/' do
  @file_list = Dir.entries("books").select { |f| !File.directory?(f) }
  puts params[:file]
  if params[:word] and params[:file] and !params[:word].eql?("") and !params[:file].eql?("")
    word = WordSearch.new(params[:file].values, params[:word])
    @searches = word.open_book
    puts @searches.inspect
  end
  erb :index
end
