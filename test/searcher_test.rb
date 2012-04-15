#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/searcher'

class SearcherTest < MiniTest::Unit::TestCase

  def setup()
  end

  def teardown()
  end


  def test_searcher_search_terms()
    a_searcher = Searcher.new(['boo', 'far'])
    actual_result = a_searcher.search_terms
    expected_result = ['boo', 'far']
    assert_equal(expected_result, actual_result)
  end


  def test_search()
    a_searcher = Searcher.new(['squirrel', 'chipmunk'])
    actual_result = a_searcher.search('directory_dont_care', 'search_term_dont_care')
    expected_result = "README.md\nRakefile\ndata\nlib\ntest\n"
    assert_equal(expected_result, actual_result)
  end

end
