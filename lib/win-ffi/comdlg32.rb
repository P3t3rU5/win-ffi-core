require 'win-ffi/lib_base'

module WinFFI
  module Comdlg32
    extend WinFFI::LibBase

    ffi_lib 'Comdlg32'
  end
end