#!/usr/bin/env ruby


class Searcher

  attr_reader :search_terms

  def initialize(search_terms)
    @search_terms = search_terms
  end


  # Use ack to search directory for files containing search term
  # Current implementation doesn't use directory parameter.
  def search(directory, search_term)
    %x[ack #{search_term}]
  end

end
