require 'win-ffi/core/lib_base'

module WinFFI
  module LibBase
    typedef (WinFFI.encoding == 'A' ? :char : :ushort), :tchar
    typedef :ushort, :atom
    typedef :uchar,  :byte
    typedef :ushort, :word
    typedef :uint,   :dword
    typedef :uint,   :colorref
    typedef :uint,   :wparam
    typedef :long,   :lparam
    typedef :long,   :lresult
    typedef :long,   :hresult
    typedef :ushort, :langid
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
  end
end