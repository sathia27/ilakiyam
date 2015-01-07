require 'sinatra'
require_relative 'word_search'
class TamilWordSearch < Sinatra::Base
  get '/' do
    @file_list = Dir.entries("books").select { |f| !File.directory?(f) }
    if params[:word] and params[:file] and !params[:word].eql?("") and !params[:file].eql?("")
      word = WordSearch.new([params[:file]], params[:word])
      @searches = word.open_book
      puts @searches.inspect
    end
    erb :index
  end
end
