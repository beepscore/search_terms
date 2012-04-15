#!/usr/bin/env ruby


class Searcher

  attr_reader :search_terms

  def initialize(search_terms)
    @search_terms = search_terms
  end


  # Current implementation of searcher doesn't use its parameters,
  # returns ls of current directory
  # TODO: Use parameters and ack to search for files containing search term
  def search(directory, search_term)
    result = %x(ls)
  end

end
