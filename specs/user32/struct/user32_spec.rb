require 'rspec'
require 'win-ffi/user32/struct/accessibility/access_timeout'
RSpec.describe 'ACCESSTIMEOUT' do

  it "should create a new instance" do
    expect{ ACCESSTIMEOUT.new }.to_not raise_error
  end
end