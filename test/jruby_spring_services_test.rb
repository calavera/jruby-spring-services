require 'test_helper'

class FooController < ActionController::Base
  include_spring_bean :foo
end

class JrubySpringServicesTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
end
