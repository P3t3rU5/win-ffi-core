require 'facets/string/snakecase'

module WinFFI
  VERSION = '0.0.3'

  require_relative 'lib_base'
  extend LibBase

  require_relative "windows/system_info"

  %i'
    POINT
    SIZE
    RECT
  '.each { |f| require_relative "windows/structs/#{f.to_s.downcase}" }

  require_relative "windows/structs/paint_struct"

  %i'
    ColorTypes
    LR
  '.each { |f| require_relative "windows/enums/#{f.to_s.snakecase}" }

  %i'
    Authorization
    Device
    Error
    Thread
  '.each { |f| require_relative "windows/#{f.to_s.snakecase}" } if WinFFI::WindowsVersion >= :xp

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
  '.each { |f| require_relative "windows/#{f.to_s.snakecase}" }
end
