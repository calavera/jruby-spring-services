$:.unshift(File.dirname(__FILE__) + '/../lib') 
  unless $:.include?(File.dirname(__FILE__) + '/../lib') || $:.include?(File.expand_path(File.dirname(__FILE__) + '/../lib'))

require 'rubygems'
require 'active_support'
require 'active_support/test_case'

Dir.glob(File.dirname(__FILE__) + '/lib') do |jar_file|
  require jar_file
end

require 'jruby_spring_services'