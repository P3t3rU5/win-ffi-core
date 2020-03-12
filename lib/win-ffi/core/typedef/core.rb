module WinFFI
  module LibBase
    if WinFFI.x64?
      typedef :int,  :half_ptr
      typedef :uint, :uhalf_ptr
    else
      typedef :short,  :half_ptr
      typedef :ushort, :uhalf_ptr
    end

    typedef (WinFFI.ascii? ? :char : :ushort), :tchar
    typedef :ushort,    :wchar
    typedef :char,      :cchar

    typedef :intptr_t,  :int_ptr
    typedef :intptr_t,  :long_ptr
    typedef :uintptr_t, :uint_ptr
    typedef :uintptr_t, :ulong_ptr

    typedef :ushort,     :word
    typedef :word,       :atom
    typedef :uchar,      :byte
    typedef :byte,       :boolean
    typedef :ulong,      :dword
    typedef :ulong_ptr,  :dword_ptr
    typedef :int64,      :dword64
    typedef :ulong_long, :dword_long
    typedef :ulong_long, :dwordlong
    typedef :ulong_long, :ulonglong
    typedef :uint64,     :dword64

    typedef :uint,       :wparam
    typedef :long,       :lparam
    typedef :long_ptr,   :lresult
    typedef :word,       :hresult
    typedef :ushort,     :langid
    typedef :size_t,     :ulong_ptr

    typedef :dword,      :colorref
    typedef :dword,      :lcid
    typedef :dword,      :lctype
    typedef :dword,      :lgrpid

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
    typedef :pointer, :hkey
    typedef :pointer, :hpalette
    typedef :pointer, :hmonitor

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
