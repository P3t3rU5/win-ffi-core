require 'rspec'
require 'win-ffi/core'

RSpec.describe 'Definitions' do

  files = Dir.glob("#{__dir__}/../lib/**/*.rb").shuffle

  files.each do |f|
    it "should load #{f}" do
      next if f.include?("lib_base") || f.include?("version")
      expect { require f }.to_not raise_error
    end
  end

end