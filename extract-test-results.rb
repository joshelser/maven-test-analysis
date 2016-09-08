#!/usr/bin/env ruby

require 'nokogiri'
require 'optparse'

def parse_test_case(test_case)
  test_name = test_case.attr('name')
  class_name = test_case.attr('classname')
  time = test_case.attr('time')
  return "#{class_name},#{test_name},#{time}"
end

def extract_test_results(filename)
  doc = File.open(filename) {|file| Nokogiri::XML(file)}
  test_cases = doc.xpath('//testsuite//testcase')
  test_cases.each {|test_case| puts parse_test_case(test_case)}
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: extract-test-results.rb <filename> [... <filename>]"
end.parse!

ARGV.each {|f| extract_test_results(f) }

