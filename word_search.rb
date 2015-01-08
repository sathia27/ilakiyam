class WordSearch
  attr_accessor :books, :word, :book_searches
  def initialize books, word
    @books = books
    @word = word
    @book_searches = []
  end

  def open_book
    i = 0
    @books.each do |book_name|
      content_array = File.open("books/#{book_name}").readlines
      #content_array = content_array.collect { |line| line.strip }.select { |line| line != "" }
      matched_lines = content_array.grep(/#{@word}/)
      matched_lines.each do |line|
        index_line = content_array.index(line)
        first_line_number = index_line - 1
        if first_line_number > 0
          @book_searches << [first_line_number+1, content_array[first_line_number], book_name]
        end
        @book_searches << [index_line+1, line.gsub(@word, "<b>#{@word}</b>"), book_name]
        if content_array[index_line+2]
          @book_searches << [index_line+2, content_array[index_line+2], book_name]
        end
      end
      i+=1
    end
    @book_searches
  end
end
