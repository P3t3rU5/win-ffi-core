module WinFFI
  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'

    # %i'
    #   dll
    #   filesystem
    #   memory
    #   volume
    # '.each { |f| require_relative  "../functions/kernel32/#{f}" } if WinFFI::WindowsVersion >= :xp
  end
end

