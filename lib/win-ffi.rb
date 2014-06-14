require 'requirium'

module WinFFI
  VERSION = '0.0.2'
  extend Requirium

  require_relative 'lib_base'
  extend LibBase

  %i'
    POINT
    SIZE
    RECT
  '.each { |f| autorequire_relative f, "windows/structs/#{f.to_s.downcase}" }

  autorequire_relative :PAINTSTRUCT, "windows/structs/paint_struct"

  %i'
    ColorTypes
    LR
  '.each { |f| autorequire_relative f, "windows/enums/#{f.to_s.snakecase}" }

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
  '.each { |f| autorequire_relative f, "windows/#{f.to_s.snakecase}" }

  autorequire_relative :WindowsVersion, "windows/system_info"

  %i'
    Authorization
    Device
    Error
    Thread
  '.each { |f| autorequire_relative f, "windows/#{f.to_s.snakecase}" } if WinFFI::WindowsVersion >= :xp
end
