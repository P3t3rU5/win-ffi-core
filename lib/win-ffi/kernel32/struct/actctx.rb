require 'win-ffi/kernel32/enum/activation_context'

module WinFFI
  module Kernel32
    class ACTCTX < FFIStruct
      layout :cbSize,                 :ulong,
             :dwFlags,                ActivationContext,
             :lpSource,               :pointer,
             :wProcessorArchitecture, :ushort,
             :wLangId,                :langid,
             :lpAssemblyDirectory,    :pointer,
             :lpResourceName,         :pointer,
             :lpApplicationName,      :pointer,
             :hModule,                :hmodule

      def initialize(*args)
        super
        self.cbSize = self.size
      end
    end
  end
end