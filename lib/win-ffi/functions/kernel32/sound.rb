require 'win-ffi/functions/kernel32'

module WinFFI
  module Kernel32
    #BOOL WINAPI Beep(
    #  _In_  DWORD dwFreq,
    #  _In_  DWORD dwDuration )
    (attach_function :Beep, [:ulong, :ulong], :bool) if WindowsVersion >= :xp
  end
end