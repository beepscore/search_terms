#!/usr/bin/env ruby


class SearchTerms

  attr_reader :filename
  attr_reader :file_string

  def initialize(filename)
    @filename = filename

    search_terms_file = File.open('data/my_file.txt', 'r')

    @file_string = ""
    search_terms_file.each_line do |line|
      puts "line : #{line}"
      @file_string += "#{line}"
    end

    search_terms_file.close
  end

end
