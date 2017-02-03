require 'ffi'
require 'win-ffi/core/version'

module WinFFI
  LOGGER.info "WinFFI v#{WinFFI::VERSION}"

  @encoding = (__ENCODING__.name =~ /ASCII/ ? 'A' : 'W')

  def self.encoding
    @encoding
  end

  def self.encoding=(encoding)
    @encoding = encoding
  end

  module LibBase
    extend FFI::Library
    ffi_convention :stdcall
  end
end

require 'win-ffi/core/struct'
require 'win-ffi/core/typedef/core'

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
  end

  require 'win-ffi/kernel32/struct/system_info/os_version_info_ex'

  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724451(v=vs.85).aspx
    # BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    encoded_function 'GetVersionEx', [OSVERSIONINFOEX.ptr], :bool
  end

  Architecture = FFI::Platform::CPU # "i386-mingw32" | "x64-mingw32"

  WindowsVersion = OSVERSIONINFOEX.new.get!

  WindowsVersion.major, WindowsVersion.minor, WindowsVersion.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  LOGGER.info "#{WindowsVersion.to_s} #{Architecture} #{__ENCODING__.to_s}"
end