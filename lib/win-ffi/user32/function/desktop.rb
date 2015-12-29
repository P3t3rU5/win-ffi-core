require 'win-ffi/user32'

require 'win-ffi/user32/enum/desktop_access_flags'

require 'win-ffi/general/struct/security_attributes'

require 'win-ffi/user32/function/window/window'

module WinFFI
  module User32

    typedef :pointer, :hdesk

    #BOOL WINAPI CloseDesktop( _In_  HDESK hDesktop )
    attach_function 'CloseDesktop', [:hdesk], :bool

    #HDESK WINAPI CreateDesktop(
    #  _In_        LPCTSTR lpszDesktop,
    #  _Reserved_  LPCTSTR lpszDevice,
    #  _Reserved_  DEVMODE *pDevmode,
    #  _In_        DWORD dwFlags,
    #  _In_        ACCESS_MASK dwDesiredAccess,
    #  _In_opt_    LPSECURITY_ATTRIBUTES lpsa )
    encoded_function 'CreateDesktop', [:string, :string, :pointer, :dword, DesktopAccessFlags, SECURITY_ATTRIBUTES.ptr], :hdesk

    #BOOL CALLBACK EnumDesktopProc(
    #  _In_  LPTSTR lpszDesktop,
    #  _In_  LPARAM lParam )
    EnumDesktopProc = callback 'EnumDesktopProc', [:string, :lparam], :bool


    #BOOL WINAPI EnumDesktops(
    #  _In_opt_  HWINSTA hwinsta,
    #  _In_      DESKTOPENUMPROC lpEnumFunc,
    #  _In_      LPARAM lParam )
    encoded_function 'EnumDesktops', [:hwinsta, EnumDesktopProc, :lparam], :bool

    #BOOL WINAPI EnumDesktopWindows(
    #  _In_opt_  HDESK hDesktop,
    #  _In_      WNDENUMPROC lpfn,
    #  _In_      LPARAM lParam )
    attach_function 'EnumDesktopWindows', [:hdesk, EnumWindowsProc, :lparam], :bool

    #HDESK WINAPI GetThreadDesktop( _In_  DWORD dwThreadId )
    attach_function 'GetThreadDesktop', [:dword], :hdesk

    #HDESK WINAPI OpenDesktop(
    #  _In_  LPTSTR lpszDesktop,
    #  _In_  DWORD dwFlags,
    #  _In_  BOOL fInherit,
    #  _In_  ACCESS_MASK dwDesiredAccess )
    encoded_function 'OpenDesktop', [:string, :dword, :bool, DesktopAccessFlags], :hdesk

    #HDESK WINAPI OpenInputDesktop(
    #  _In_  DWORD dwFlags,
    #  _In_  BOOL fInherit,
    #  _In_  ACCESS_MASK dwDesiredAccess )
    attach_function 'OpenInputDesktop', [:dword, :bool, DesktopAccessFlags], :hdesk

    #BOOL WINAPI SetThreadDesktop( _In_  HDESK hDesktop )
    attach_function 'SetThreadDesktop', [:hdesk], :bool

    #BOOL WINAPI SwitchDesktop( _In_  HDESK hDesktop )
    attach_function 'SwitchDesktop', [:hdesk], :bool

    if WindowsVersion >= :vista

      #HDESK WINAPI CreateDesktopEx(
      #  _In_        LPCTSTR lpszDesktop,
      #  _Reserved_  LPCTSTR lpszDevice,
      #  _Reserved_  DEVMODE *pDevmode,
      #  _In_        DWORD dwFlags,
      #  _In_        ACCESS_MASK dwDesiredAccess,
      #  _In_opt_    LPSECURITY_ATTRIBUTES lpsa,
      #  _In_        ULONG ulHeapSize,
      #  _Reserved_  PVOID pvoid)
      encoded_function 'CreateDesktopEx', [:string, :string, :pointer, :dword, DesktopAccessFlags, SECURITY_ATTRIBUTES.ptr, :ulong, :pointer], :hdesk

    end

  end
end