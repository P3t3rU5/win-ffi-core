require 'win-ffi/core/lib_base'

module WinFFI
  module LibBase
    typedef (WinFFI.encoding == 'A' ? :char : :ushort), :tchar
    typedef :ushort,     :atom
    typedef :uchar,      :byte
    typedef :ushort,     :word
    typedef :ulong,      :dword
    typedef :ulong_long, :dword_long
    typedef :ulong_long, :dwordlong
    typedef :uint64,     :dword64
    typedef :uint,       :wparam
    typedef :long,       :lparam
    typedef :long,       :lresult
    typedef :long,       :hresult
    typedef :ushort,     :langid
    typedef :size_t,     :ulong_ptr

    typedef :dword,      :colorref

    typedef :pointer, :handle
    typedef :pointer, :hbitmap
    typedef :pointer, :hbrush
    typedef :pointer, :hhook
    typedef :pointer, :hdc
    typedef :pointer, :hevent
    typedef :pointer, :hglobal
    typedef :pointer, :hicon
    typedef :pointer, :hinstance
    typedef :pointer, :hmenu
    typedef :pointer, :hmodule
    typedef :pointer, :hpen
    typedef :pointer, :hwnd
    typedef :pointer, :humpd

    typedef :pointer, :puint
    typedef :pointer, :plong
    typedef :pointer, :pulong
    typedef :pointer, :pshort
    typedef :pointer, :pushort
    typedef :pointer, :puchar
    typedef :pointer, :psz
    typedef :pointer, :pfloat

    typedef :pointer, :pbool
    typedef :pointer, :lpbool

    typedef :pointer, :pbyte
    typedef :pointer, :lpbyte
    typedef :pointer, :ppbyte

    typedef :pointer, :pint
    typedef :pointer, :lpint

    typedef :pointer, :pword
    typedef :pointer, :lpword

    typedef :pointer, :lplong

    typedef :pointer, :pdword
    typedef :pointer, :lpdword

    typedef :pointer, :lpvoid
    typedef :pointer, :lpcvoid

    typedef :pointer, :callback
  end
end