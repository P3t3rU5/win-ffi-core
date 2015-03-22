require 'facets/pathname'
require_relative 'win-ffi/version'
require_relative 'win-ffi/struct'

module WinFFI
  require_relative 'win-ffi/lib_base'
  extend LibBase

  require_relative "win-ffi/wrappers/system_info"

  puts "WinFFI #{WinFFI::VERSION}"
  puts WinFFI::WindowsVersion

  require_relative 'win-ffi/functions/kernel32'
  require_relative 'win-ffi/functions/gdi32'
  require_relative 'win-ffi/functions/user32'

  require_relative 'win-ffi/wrappers/screen'
  require_relative 'win-ffi/wrappers/keyboard'
  require_relative 'win-ffi/wrappers/dll'
end
