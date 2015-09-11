lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require_relative 'lib/win-ffi/version'

Gem::Specification.new do |gem|
  gem.name          = 'win-ffi'
  gem.version       = WinFFI::VERSION
  gem.summary       = 'FFI definitions for Windows API'
  gem.description   = 'FFI definitions for Windows API.'
  gem.license       = 'MIT'
  gem.authors       = %w'P3t3rU5 SilverPhoenix99'
  gem.email         = %w'pedro.megastore@gmail.com silver.phoenix99@gmail.com'
  gem.homepage      = 'https://github.com/P3t3rU5/win-fii'
  gem.require_paths = %w'lib'
  gem.files         = Dir['{lib/**/*.rb,*.md}']
  gem.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.10'
  gem.add_dependency 'facets', '~> 3'
  gem.post_install_message = <<-eos
+----------------------------------------------------------------------------+
  Thanks for choosing WinFFI.

  ==========================================================================
  #{WinFFI::VERSION} Changes:
    - First Official Version

  ==========================================================================

  If you find any bugs, please report them on
    https://github.com/P3t3rU5/win-ffi/issues

+----------------------------------------------------------------------------+
  eos
end
