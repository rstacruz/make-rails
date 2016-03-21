$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'make-rails'

require 'minitest/autorun'

ENV['RAILS_ENV'] = 'test'

require File.expand_path("../rails_app/config/environment.rb",  __FILE__)
require 'rails'
require 'rails/test_help'
Rails.backtrace_cleaner.remove_silencers!

