module WinFFI
  module User32
    module Desktop
      extend LibBase

      ffi_lib 'user32'


      #BOOL WINAPI CloseDesktop( _In_  HDESK hDesktop )
      attach_function 'CloseDesktop', [:hdesk], :bool

      #HDESK WINAPI CreateDesktop(
      #  _In_        LPCTSTR lpszDesktop,
      #  _Reserved_  LPCTSTR lpszDevice,
      #  _Reserved_  DEVMODE *pDevmode,
      #  _In_        DWORD dwFlags,
      #  _In_        ACCESS_MASK dwDesiredAccess,
      #  _In_opt_    LPSECURITY_ATTRIBUTES lpsa )
      attach_function 'CreateDesktopA', [:string, :string, :pointer, :dword, :int, :pointer], :hdesk
      attach_function 'CreateDesktopW', [:string, :string, :pointer, :dword, :int, :pointer], :hdesk

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
        attach_function 'CreateDesktopExA', [:string, :string, :pointer, :dword, :int, :pointer, :ulong, :pointer], :hdesk
        attach_function 'CreateDesktopExW', [:string, :string, :pointer, :dword, :int, :pointer, :ulong, :pointer], :hdesk

      end

      #BOOL CALLBACK EnumDesktopProc(
      #  _In_  LPTSTR lpszDesktop,
      #  _In_  LPARAM lParam )
      callback 'EnumDesktopProc', [:string, :lparam], :bool

      #BOOL WINAPI EnumDesktops(
      #  _In_opt_  HWINSTA hwinsta,
      #  _In_      DESKTOPENUMPROC lpEnumFunc,
      #  _In_      LPARAM lParam )
      attach_function 'EnumDesktopsA', [:hwinsta, :pointer, :lparam], :bool
      attach_function 'EnumDesktopsW', [:hwinsta, :pointer, :lparam], :bool

      #BOOL WINAPI EnumDesktopWindows(
      #  _In_opt_  HDESK hDesktop,
      #  _In_      WNDENUMPROC lpfn,
      #  _In_      LPARAM lParam )
      attach_function 'EnumDesktopWindows', [:hdesk, :pointer, :lparam], :bool

      #HDESK WINAPI GetThreadDesktop( _In_  DWORD dwThreadId )
      attach_function 'GetThreadDesktop', [:dword], :hdesk

      #HDESK WINAPI OpenDesktop(
      #  _In_  LPTSTR lpszDesktop,
      #  _In_  DWORD dwFlags,
      #  _In_  BOOL fInherit,
      #  _In_  ACCESS_MASK dwDesiredAccess )
      attach_function 'OpenDesktopA', [:string, :dword, :bool, :pointer], :hdesk
      attach_function 'OpenDesktopW', [:string, :dword, :bool, :pointer], :hdesk

      #HDESK WINAPI OpenInputDesktop(
      #  _In_  DWORD dwFlags,
      #  _In_  BOOL fInherit,
      #  _In_  ACCESS_MASK dwDesiredAccess )
      attach_function 'OpenInputDesktop', [:dword, :bool, :pointer], :hdesk

      #BOOL WINAPI SetThreadDesktop( _In_  HDESK hDesktop )
      attach_function 'SetThreadDesktop', [:hdesk], :bool

      #BOOL WINAPI SwitchDesktop( _In_  HDESK hDesktop )
      attach_function 'SwitchDesktop', [:hdesk], :bool

    end
  end
end