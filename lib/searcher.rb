#!/usr/bin/env ruby


class Searcher

  # Current implementation of searcher doesn't use its parameters,
  # returns ls of current directory
  # TODO: Use parameters and ack to search for files containing search term
  def search(directory, search_term)
    result = %x(ls)
  end

end
