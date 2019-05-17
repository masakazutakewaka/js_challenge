ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'mocha/minitest'

require_relative '../app'
