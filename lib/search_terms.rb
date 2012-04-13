#!/usr/bin/env ruby


class SearchTerms

  attr_reader :filename
  attr_reader :file_string

  def initialize(filename)
    @filename = filename

    # at end of block, file will be closed automatically
    File.open('data/my_file.txt', 'r') do |file|

      @file_string = ""
      file.each_line do |line|
        puts "line : #{line}"
        @file_string += "#{line}"
      end

    end
  end

end
