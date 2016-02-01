require 'win-ffi/lib_base'

module WinFFI
  module Ntdll
    extend WinFFI::LibBase

    ffi_lib 'Ntdll'
  end
end