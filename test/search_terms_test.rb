#!/usr/bin/env ruby
# encoding : utf-8
# Need to set encoding for this source code file
# so tests can set expected result strings to contain characters with accents.
# For example, Localización
# Reference Programming Ruby 1.9 Ch 17.2

require 'minitest/autorun'
require_relative '../lib/search_terms'

class SearchTermsTest < MiniTest::Test

  def test_string_from_file()
    actual_result = SearchTerms.string_from_file('data/my_file.txt', 'utf-8')
    expected_result = "\"Monday\"\n\"Tuesday\"\ngoobers\n\"Wednesday\"\n4\n"
    assert_equal(expected_result, actual_result)
  end

  def test_string_from_file_utf_8_line()
    string_from_file = SearchTerms.string_from_file('data/my_file.txt', 'utf-8')
    actual_result = string_from_file.lines.to_a[1]
    expected_result = "\"Tuesday\"\n"
    assert_equal(expected_result, actual_result)
  end

  def test_string_from_file_utf_16le_line()
    # Terminal shows system considers Localizable.strings as UTF-16LE 
    # data$ file Localizable.strings
    # Localizable.strings: Little-endian UTF-16 Unicode c program text
    # Explicitly set encoding to utf-16le. Otherwise ruby assumes file is UTF-8
    string_from_file = SearchTerms.string_from_file('data/Localizable.strings', 'utf-16le')
    expected_result = "   Localizable.strings\n"
    assert_equal(expected_result, string_from_file.lines.to_a[1])

    expected_result = "\"Location\" = \"Localización\";\n"
    assert_equal(expected_result, string_from_file.lines.to_a[24])
  end

  def test_search_terms_array_localizable_strings_file()
    string_from_file = SearchTerms.string_from_file('data/Localizable.strings', 'utf-16le')
    actual_result = SearchTerms.search_terms_array_from_string(string_from_file)
    expected_count = 15
    assert_equal(expected_count, actual_result.count)

    assert_equal("\"Enter Feed ID\"", actual_result[2])
  end

  def test_search_terms_array_my_file()
    string_from_file = SearchTerms.string_from_file('data/my_file.txt', 'utf-8')
    actual_result = SearchTerms.search_terms_array_from_string(string_from_file)
    expected_count = 3
    assert_equal(expected_count, actual_result.count)

    expected_result = ["\"Monday\"", "\"Tuesday\"", "\"Wednesday\""]
    assert_equal(expected_result, actual_result)
  end

end
