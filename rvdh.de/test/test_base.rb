RACK_ENV = 'test'
require 'minitest/spec'
require 'minitest/mock'
require 'mocha'
MiniTest::Unit.autorun

require File.expand_path('../../grainy_days', __FILE__)
Sinatra::HacketySling::Post.directory = 'test/test_posts'
