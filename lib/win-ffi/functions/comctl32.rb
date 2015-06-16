module WinFFI
  module Comctl32
    extend LibBase

    ffi_lib 'comctl32'

    require_relative 'comctl32/listbox'
    require_relative '../functions/comctl32/control'
  end
end