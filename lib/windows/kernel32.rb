module WinFFI
  module Kernel32
    extend LibBase

    %i'
      Memory
      Sound
      Time
    '.each { |f| autorequire_relative f, "kernel32/#{f.to_s.snakecase}" }

    %i'
      DLL
      Filesystem
      Memory
      Volume
    '.each { |f| autorequire_relative f, "kernel32/#{f.to_s.snakecase}" } if WinFFI::WindowsVersion >= :xp
  end
end

