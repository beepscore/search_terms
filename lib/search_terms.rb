#!/usr/bin/env ruby


class SearchTerms

  attr_reader :filename
  attr_reader :file_string

  def initialize(filename)
    @filename = filename

    # at end of block, file will be closed automatically
    File.open(@filename, 'r') do |file|

      @file_string = ""
      file.each_line do |line|
        @file_string += line
      end

    end
  end

end
