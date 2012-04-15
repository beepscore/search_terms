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
    # To simplify test, list search term in only one statement
    # This way, ack finds only one line.
    # Do not explicitly list search term a second time in expected result.
    # This way ack does not find expected result assignment line,
    # and the test avoids a circular reference cycle that would require changing expected result,
    # which would generate a different ack result...
    example_one = "elephant"
    # initialize a_searcher with search terms
    a_searcher = Searcher.new([example_one, "another search term"])
    actual_result = a_searcher.search('directory_dont_care', a_searcher.search_terms[0])
    
    # Note this test is brittle, because expected result depends on line number of example_one
    expected_result = "test/searcher_test.rb:30:    example_one = \"#{example_one}\"\n"
    assert_equal(expected_result, actual_result)
  end

end
