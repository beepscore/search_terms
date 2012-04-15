#!/usr/bin/env ruby


class SearchTerms

  attr_reader :file_name
  attr_reader :file_string

  def initialize(file_name)
    @file_name = file_name

    # at end of block, file will be closed automatically
    File.open(@file_name, 'r') do |file|

      @file_string = ""
      file.each_line do |line|
        @file_string += line
      end

    end
  end

end
