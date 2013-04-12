require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'rspec'
  require 'elhub/version'

  include Elhub
end

Spork.each_run do
end
