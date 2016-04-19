require_relative 'lib/win-ffi/core/version'

Gem::Specification.new do |gem|
  gem.name          = 'win-ffi-core'
  gem.version       = WinFFI::VERSION
  gem.summary       = 'FFI definitions for Windows API'
  gem.description   = 'FFI definitions for Windows API.'
  gem.license       = 'MIT'
  gem.authors       = %w'P3t3rU5'
  gem.email         = %w'pedro.at.miranda@gmail.com'
  gem.homepage      = 'https://github.com/P3t3rU5/win-ffi-core'
  gem.require_paths = %w'lib'
  gem.files         = Dir['{lib/**/*.rb,*.md}']
  gem.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.10'
  gem.add_dependency 'facets', '~> 3'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.post_install_message = <<-eos
+----------------------------------------------------------------------------+
  Thanks for choosing WinFFI.

  ==========================================================================
  #{WinFFI::VERSION} Changes:
    - Refactored Directory Structure

  ==========================================================================

  If you find any bugs, please report them on
    https://github.com/P3t3rU5/win-ffi-core/issues

+----------------------------------------------------------------------------+
  eos
end
