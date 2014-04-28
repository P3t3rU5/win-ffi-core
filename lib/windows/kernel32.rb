module WinFFI
  module Kernel32
    extend LibBase
    extend Requirium

    %i'
      Memory
      Sound
      Time
    '.each { |f| autorequire_relative f, "kernel32/#{f.to_s.snakecase}" }

        %i'
      Dll
      Filesystem
      Memory
      Volume
    '.each { |f| autorequire_relative f, "kernel32/#{f.to_s.snakecase}" } if WinFFI::WindowsVersion >= :xp
  end
end

