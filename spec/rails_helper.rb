# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'support/request_spec_helper'

RSpec.configure do |config|
  path_to_openapi = Rails.root.join('docs', 'openapi.yml')

  config.include Skooma::RSpec[path_to_openapi], type: :request

  config.include RequestSpecHelper, type: :request
end
