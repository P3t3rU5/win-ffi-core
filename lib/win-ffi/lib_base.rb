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
    %i'haccel handle hbitmap hbrush hconv hcursor hdc hddedata hdesk hgdiobj hglobal hicon hinstance hkl hmenu hmetafile hmonitor hmodule hrgn hsz hwnd hwinsta'.each do |s|
      typedef :pointer, s
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