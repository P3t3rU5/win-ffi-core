lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require_relative 'lib/win-ffi/version'

Gem::Specification.new do |s|
  s.name          = 'win-ffi'
  s.version       = WinFFI::VERSION
  s.summary       = 'FFI definitions for Windows API'
  s.description   = 'FFI definitions for Windows API.'
  s.license       = 'MIT'
  s.authors       = %w'P3t3rU5 SilverPhoenix99'
  s.email         = %w'pedro.megastore@gmail.com silver.phoenix99@gmail.com'
  s.homepage      = 'https://github.com/P3t3rU5/win-fii'
  s.require_paths = %w'lib'
  s.files         = Dir['{lib/**/*.rb,*.md}']
  s.add_dependency 'ffi', '1.9'
  s.add_dependency 'facets', '~> 3'
  s.post_install_message = <<-eos
+----------------------------------------------------------------------------+
  Thanks for choosing WinFFI.

  ==========================================================================
  #{WinFFI::VERSION} Changes:
    - First Version

  ==========================================================================

  If you find any bugs, please report them on
    https://github.com/P3t3rU5/win-ffi/issues

+----------------------------------------------------------------------------+
  eos
end
