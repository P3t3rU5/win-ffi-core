module WinFFI
  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'
    %i'
      handle
      memory
      sound_flags
      volume
    '.each { |f| require_relative "../enums/kernel32/#{f}" }

    %i'
      activation
      error
      handle
      process
      resource
      sound
      string
      system_info
      time
    '.each { |f| require_relative "../functions/kernel32/#{f}" }

    %i'
      dll
      filesystem
      memory
      volume
    '.each { |f| require_relative  "../functions/kernel32/#{f}" } if WinFFI::WindowsVersion >= :xp
  end
end

