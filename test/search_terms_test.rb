#!/usr/bin/env ruby
# encoding : utf-8
# Need to set encoding for this source code file
# so tests can set expected result strings to contain characters with accents.
# For example, Localización
# Reference Programming Ruby 1.9 Ch 17.2

require 'minitest/autorun'
require_relative '../lib/search_terms'

class SearchTermsTest < MiniTest::Test

  def setup()
  end

  def teardown()
  end

  def test_file_encoding()
    a_search_terms = SearchTerms.new('data/my_file.txt', 'utf-8')
    actual_result = a_search_terms.file_encoding
    expected_result = Encoding.find('UTF-8')
    assert_equal(expected_result, actual_result)

    # Terminal shows system considers Localizable.strings as UTF-16LE 
    # data$ file Localizable.strings
    # Localizable.strings: Little-endian UTF-16 Unicode c program text
    # Explicitly set encoding to utf-16le. Otherwise ruby assumes file is UTF-8
    a_search_terms = SearchTerms.new('data/Localizable.strings', 'utf-16le')
    actual_result = a_search_terms.file_encoding
    expected_result = Encoding.find('utf-16le')
    assert_equal(expected_result, actual_result)
  end


  def test_file_name()
    a_search_terms = SearchTerms.new('data/my_file.txt', 'utf-8')
    actual_result = a_search_terms.file_name

    expected_result = 'data/my_file.txt'
    assert_equal(expected_result, actual_result)
  end


  def test_file_line()
    a_search_terms = SearchTerms.new('data/my_file.txt', 'utf-8')
    actual_result = a_search_terms.file_string.lines.to_a[1]
    expected_result = "\"Tuesday\"\n"
    assert_equal(expected_result, actual_result)

    a_search_terms = SearchTerms.new('data/Localizable.strings', 'utf-16le')
    actual_result = a_search_terms.file_string.lines.to_a[1]
    expected_result = "   Localizable.strings\n"
    assert_equal(expected_result, actual_result)

    actual_result = a_search_terms.file_string.lines.to_a[24]
    expected_result = "\"Location\" = \"Localización\";\n"
    assert_equal(expected_result, actual_result)
  end


  def test_file_string()
    a_search_terms = SearchTerms.new('data/my_file.txt', 'utf-8')
    actual_result = a_search_terms.file_string
    expected_result = "\"Monday\"\n\"Tuesday\"\ngoobers\n\"Wednesday\"\n4\n"
    assert_equal(expected_result, actual_result)
  end


  def test_search_terms_array_localizable_strings_file()
    a_search_terms = SearchTerms.new('data/Localizable.strings', 'utf-16le')
    file_string = a_search_terms.file_string
    actual_result = SearchTerms.search_terms_array_from_string(file_string)
    expected_count = 15
    assert_equal(expected_count, actual_result.count)

    assert_equal("\"Enter Feed ID\"", actual_result[2])
  end


  def test_search_terms_array_my_file()
    a_search_terms = SearchTerms.new('data/my_file.txt', 'utf-8')
    file_string = a_search_terms.file_string
    actual_result = SearchTerms.search_terms_array_from_string(file_string)
    expected_count = 3
    assert_equal(expected_count, actual_result.count)

    expected_result = ["\"Monday\"", "\"Tuesday\"", "\"Wednesday\""]
    assert_equal(expected_result, actual_result)
  end

end
