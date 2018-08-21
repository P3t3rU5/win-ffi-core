require_relative 'encoding'

module WinFFI
  ARCHITECTURE = FFI::Platform::ARCH # "i386" | "x86_64"

  def self.x64?
    ARCHITECTURE == 'x86_64'
  end

  def self.x86?
    ARCHITECTURE == 'i386'
  end

  ENCODING_SUFFIX = ascii? ? 'A' : 'W'

  module LibBase
    extend FFI::Library
    ffi_convention :stdcall
  end
end

require_relative 'struct'
require_relative 'typedef/core'

module WinFFI
  module LibBase
    def encoded_function(name, *args, ruby_name: nil)
      ruby_name = name unless ruby_name
      attach_function ruby_name, name + WinFFI.encoding, *args
    end

    def define_prefix(prefix, target_enum, without_underscore = false)
      target_enum.to_h.each do |k, v|
        name = "#{prefix}#{without_underscore ? '' : '_'}#{k}"
        const_set(name, v) unless const_defined? name
      end
    end

    def define_suffix(suffix, target_enum, without_underscore = false)
      target_enum.to_h.each do |k, v|
        name = "#{k}#{without_underscore ? '' : '_'}#{suffix}"
        const_set(name, v) unless const_defined? name
      end
    end

    def self.extended(c)
      c.extend FFI::Library
      instance_variables.each do |v|
        value = instance_variable_get(v)
        value = value.dup unless value.is_a?(Integer) || value.is_a?(Symbol)
        c.instance_variable_set(v, value)
      end
    end
  end
  extend LibBase
end

module WinFFI
  module Kernel32
    extend LibBase

    ffi_lib 'kernel32', 'KernelBase'

    require 'win-ffi/kernel32/struct/system_info/os_version_info_ex'

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724451(v=vs.85).aspx
    # BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    def self.GetVersionEx(lpVersionInfo) end
    encoded_function 'GetVersionEx', [WinFFI::Kernel32::OSVERSIONINFOEX.ptr], :bool
  end

  WINDOWS_VERSION = WinFFI::Kernel32::OSVERSIONINFOEX.new.get!

  WINDOWS_VERSION.major, WINDOWS_VERSION.minor, WINDOWS_VERSION.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  LOGGER.info "#{WINDOWS_VERSION.to_s} #{ARCHITECTURE} #{__ENCODING__.to_s}"

  CCHDEVICENAME = 32
end