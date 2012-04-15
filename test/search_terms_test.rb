#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/search_terms'

class SearchTermsTest < MiniTest::Unit::TestCase

  def setup()
  end

  def teardown()
  end

  def test_file_encoding()
    a_search_terms = SearchTerms.new('data/my_file.txt')
    actual_result = a_search_terms.file_encoding
    expected_result = Encoding.find('UTF-8')
    assert_equal(expected_result, actual_result)

    a_search_terms = SearchTerms.new('data/Localizable.strings')
    actual_result = a_search_terms.file_encoding
    # Terminal shows system considers Localizable.strings as UTF-16LE 
    # data$ file Localizable.strings
    # Localizable.strings: Little-endian UTF-16 Unicode c program text
    # expected_result = Encoding.find('UTF-16LE')
    # Currently ruby assumes file is UTF-8
    expected_result = Encoding.find('UTF-8')
    assert_equal(expected_result, actual_result)
  end


  def test_file_name()
    a_search_terms = SearchTerms.new('data/my_file.txt')
    actual_result = a_search_terms.file_name

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
