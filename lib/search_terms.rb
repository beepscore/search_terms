#!/usr/bin/env ruby


class SearchTerms

  attr_reader :file_encoding
  attr_reader :file_name
  attr_reader :file_string

  def initialize(file_name, external_encoding)
    @file_name = file_name

    # reference Programming Ruby 1.9 Ch 17.4
    internal_encoding = "utf-8"
    # avoid ruby warning:
    #   Ignoring internal encoding utf-8: it is identical to external encoding utf-8
    if (external_encoding == internal_encoding)
      read_access_and_encoding = "r"
    else
      read_access_and_encoding = "r:#{external_encoding}:#{internal_encoding}"
    end
    puts read_access_and_encoding

    # at end of block, file will be closed automatically
    File.open(@file_name, read_access_and_encoding) do |file|

      @file_encoding = file.external_encoding

      @file_string = ""
      file.each_line do |line|
        @file_string += line
      end

    end
  end

end
