require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ActivationContext = enum :activation_context,
    [
        :PROCESSOR_ARCHITECTURE_VALID, 0x001,
        :LANGID_VALID,                 0x002,
        :ASSEMBLY_DIRECTORY_VALID,     0x004,
        :RESOURCE_NAME_VALID,          0x008,
        :SET_PROCESS_DEFAULT,          0x010,
        :APPLICATION_NAME_VALID,       0x020,
        :HMODULE_VALID,                0x080

    ]
  end
end