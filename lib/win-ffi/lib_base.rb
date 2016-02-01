

require 'ffi'
require 'win-ffi/struct'

module WinFFI

  @encoding = __ENCODING__.name =~ /ASCII/ ? 'A' : 'W'

  def self.encoding
    @encoding
  end

  def self.encoding=(encoding)
    @encoding = encoding
  end

  module LibBase

    extend FFI::Library
    ffi_convention :stdcall

    typedef :ushort,    :atom
    typedef :uchar,     :byte
    typedef :ushort,    :word
    typedef :uint,      :dword
    typedef :uint,      :colorref
    typedef :uint,      :wparam
    typedef :long,      :lparam
    typedef :long,      :lresult
    typedef :long,      :hresult
    typedef :ushort,    :langid
    %i'
      handle
      hbitmap
      hbrush
      hdc
      hglobal
      hicon
      hinstance
      hmodule
      hwnd
    '.each do |s|
      typedef :pointer, s
    end

    def encoded_function(name, *args)
      attach_function name, name + WinFFI.encoding, *args
    end

    def self.extended(c)
      c.extend FFI::Library
      instance_variables.each do |v|
        value = instance_variable_get(v)
        value = value.dup unless value.is_a?(Fixnum) || value.is_a?(Symbol)
        c.instance_variable_set(v, value)
      end
    end
  end

  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'

    #BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    encoded_function 'GetVersionEx', [:pointer], :bool
  end

  require 'win-ffi/kernel32/struct/os_version_info_ex'

  WindowsVersion = OSVERSIONINFOEX.new.get!

  WindowsVersion.major, WindowsVersion.minor, WindowsVersion.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  Architecture = 1.size * 8
end

