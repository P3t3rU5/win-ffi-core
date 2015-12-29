require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    GetModuleHandleExFlag = enum :get_module_handle_ex_flag, [:none, :pin, :unchanged_refcount, :from_address]
  end
end