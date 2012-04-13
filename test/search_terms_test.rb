#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/search_terms'

class SearchTermsTest < MiniTest::Unit::TestCase

  def setup()
  end

  def teardown()
  end

  def test_filename()
    a_search_terms = SearchTerms.new('data/my_file.txt')
    actual_result = a_search_terms.filename

    expected_result = 'data/my_file.txt'
    assert_equal(expected_result, actual_result)
  end

  def test_file_string()
    a_search_terms = SearchTerms.new('data/my_file.txt')
    actual_result = a_search_terms.file_string

    expected_result = "Monday\nTuesday\nWednesday\n4\n"
    assert_equal(expected_result, actual_result)
  end
end
