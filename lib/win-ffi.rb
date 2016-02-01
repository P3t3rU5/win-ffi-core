require 'facets/pathname'
require 'win-ffi/version'
require 'win-ffi/lib_base'

module WinFFI
  extend LibBase

  puts "WinFFI #{VERSION}"
  puts "#{WindowsVersion.to_s} x#{Architecture}"

  puts __ENCODING__
end
