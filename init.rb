require 'java'
require 'jruby_spring_services'

ActionController::Base.send(:include, JRubySpringServices)
