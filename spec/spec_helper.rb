ENV['RACK_ENV'] ||= 'test'

require 'rspec'
require 'elhub'

Dotenv.load '.env.test'
