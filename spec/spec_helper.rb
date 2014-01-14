require 'rubygems'
require 'spork'
require "unionpay"

Spork.prefork do

	require 'vcr'

  require 'rspec'


	VCR.configure do |c|
		c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock # or :fakeweb
  end

  RSpec.configure do |config|
  	config.treat_symbols_as_metadata_keys_with_true_values = true
  	config.run_all_when_everything_filtered = true
  	config.filter_run :focus
  	config.order = 'random'
  end
end

Spork.each_run do
end





