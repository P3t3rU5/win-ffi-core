require 'rspec'

RSpec.describe 'Definitions' do

  files = Dir.glob("#{__dir__}/../lib/**/*.rb")

  files.each do |f|
    it "should load #{f}" do
      expect { require f }.to_not raise_error
      # expect { mod.module_eval(File.read(f)) }.to_not raise_error
    end
  end

end