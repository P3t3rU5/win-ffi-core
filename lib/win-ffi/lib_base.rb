require 'ffi'

module WinFFI
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
end