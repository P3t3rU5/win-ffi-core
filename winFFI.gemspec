lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'winffi'

Gem::Specification.new do |s|
  s.name          = 'win-ffi'
  s.version       = WinFFI::VERSION
  s.summary       = 'FFI wrapper for Windows API'
  s.description   = 'FFI wrapper for Windows API.'
  s.license       = 'MIT'
  s.authors       = %w'P3t3rU5 SilverPhoenix99'
  s.email         = %w'pedro.megastore@gmail.com silver.phoenix99@gmail.com'
  s.homepage      = 'https://github.com/P3t3rU5/win-fii'
  s.require_paths = %w'lib'
  s.files         = Dir['{lib/**/*.rb,*.md}']
  s.post_install_message = <<-eos
+----------------------------------------------------------------------------+
  Thanks for choosing WinFFI.

  ==========================================================================
  #{WinFFI::VERSION} Changes:
    - Corrected Color#== to include alpha

  ==========================================================================

  If you like what you see, support us on Pledgie:
    http://www.pledgie.com/campaigns/xxxxx

  If you find any bugs, please report them on
    https://github.com/P3t3rU5/win-ffi/issues

+----------------------------------------------------------------------------+
  eos
end