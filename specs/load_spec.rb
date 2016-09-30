require 'rspec'
require_relative '../test/test_helper'
require 'win-ffi/core'

RSpec.describe 'Definitions' do

  files = Dir.glob("#{__dir__}/../lib/**/*.rb").shuffle

  files.each do |f|
    it "should load #{f}" do
      next if f.include?("lib_base") || f.include?("system_info")
      expect { require f }.to_not raise_error
    end
  end

end