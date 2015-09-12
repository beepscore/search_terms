#!/usr/bin/env ruby


class SearchTerms

  attr_reader :file_encoding
  attr_reader :file_name
  attr_reader :file_string

  def initialize(file_name, external_encoding)
    @file_name = file_name

    # To see a file's encoding, in Terminal use
    #    $ file -I my_file.txt
    #      my_file.txt: text/x-c; charset=utf-16le

    # reference Programming Ruby 1.9 Ch 17.4
    internal_encoding = "utf-8"
    # avoid ruby warning:
    #   Ignoring internal encoding utf-8: it is identical to external encoding utf-8
    if (external_encoding == internal_encoding)
      read_access_and_encoding = "r"
    else
      read_access_and_encoding = "r:#{external_encoding}:#{internal_encoding}"
    end

    # at end of block, file will be closed automatically
    File.open(@file_name, read_access_and_encoding) do |file|

      @file_encoding = file.external_encoding

      @file_string = ""
      file.each_line do |line|
        @file_string += line
      end

    end
  end


  def self.search_terms_array_from_string(terms_string)

    search_terms_array = []
    terms_string.each_line do |line|
      if ("\"" == line[0])
        # line starts with ", assume it is a valid search term with a second ".
        # split line at " characters, take element 1, re-delimit with ""
        # add search term
        search_term = "\"" + line.split("\"")[1] + "\""
        search_terms_array.push(search_term)
      end
    end
    search_terms_array
  end

end
