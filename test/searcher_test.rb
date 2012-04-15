#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/searcher'

class SearcherTest < MiniTest::Unit::TestCase

  def setup()
  end

  def teardown()
  end

  def test_search()
    a_searcher = Searcher.new()
    actual_result = a_searcher.search('directory_dont_care', 'search_term_dont_care')
    expected_result = "README.md\nRakefile\ndata\nlib\ntest\n"
    assert_equal(expected_result, actual_result)
  end

end
