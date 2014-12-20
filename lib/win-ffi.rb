require 'facets/string/snakecase'
require_relative 'win-ffi/version'

module WinFFI
  require_relative 'win-ffi/lib_base'
  extend LibBase

  require_relative "win-ffi/windows/system_info"

  %i'
    POINT
    SIZE
    RECT
  '.each { |f| require_relative "win-ffi/windows/structs/#{f.to_s.downcase}" }

  require_relative "win-ffi/windows/structs/paint_struct"

  %i'
    ColorTypes
    LR
  '.each { |f| require_relative "win-ffi/windows/enums/#{f.to_s.snakecase}" }

  %i'
    Authorization
    Device
    Error
    Thread
  '.each { |f| require_relative "win-ffi/windows/#{f.to_s.snakecase}" } if WinFFI::WindowsVersion >= :xp

  %i'
    SystemInfo
    Gdi32
    Kernel32
    User32
    Comdlg32
    Handle
    Power
    Process
    Resource
    Shell
    String
  '.each { |f| require_relative "win-ffi/windows/#{f.to_s.snakecase}" }
end
