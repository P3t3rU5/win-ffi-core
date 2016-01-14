require 'win-ffi/user32'

require 'win-ffi/user32/enum/keyboard_layout_flags'
require 'win-ffi/user32/enum/virtual_key_flags'
require 'win-ffi/user32/enum/keyboard_modifiers'
require 'win-ffi/user32/enum/map_virtual_key'
require 'win-ffi/user32/enum/key_event_flags'

require 'win-ffi/user32/struct/info/last_input_info'
require 'win-ffi/user32/struct/input'

module WinFFI
  module User32

    typedef :pointer, :hkl

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646289(v=vs.85).aspx
    # HKL WINAPI ActivateKeyboardLayout( _In_  HKL hkl, _In_  UINT Flags )
    attach_function 'ActivateKeyboardLayout', [:hkl, KeyboardLayoutFlags], :hkl

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646290(v=vs.85).aspx
    # BOOL WINAPI BlockInput( _In_  BOOL fBlockIt )
    attach_function 'BlockInput', [:bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646291(v=vs.85).aspx
    # BOOL WINAPI EnableWindow(
    #   __in HWND hWnd,
    #   __in BOOL bEnable)
    attach_function 'EnableWindow', [:hwnd, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646292(v=vs.85).aspx
    # HWND WINAPI GetActiveWindow(void);
    attach_function 'GetActiveWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646293(v=vs.85).aspx
    # SHORT WINAPI GetAsyncKeyState#(_In_  int vKey)
    attach_function 'GetAsyncKeyState', [VirtualKeyFlags], :short

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646294(v=vs.85).aspx
    # HWND WINAPI GetFocus(void)
    attach_function 'GetFocus', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646295(v=vs.85).aspx
    # This function is provided only for compatibility with 16-bit versions of Windows.
    # UINT WINAPI GetKBCodePage(void)
    attach_function 'GetKBCodePage', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646296(v=vs.85).aspx
    # HKL WINAPI GetKeyboardLayout( _In_  DWORD idThread )
    attach_function 'GetKeyboardLayout', [:dword], :hkl

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646297(v=vs.85).aspx
    # int WINAPI GetKeyboardLayoutList(
    #   _In_   int nBuff,
    #   _Out_  HKL *lpList )
    attach_function 'GetKeyboardLayoutList', [:int, :hkl], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646298(v=vs.85).aspx
    # BOOL WINAPI GetKeyboardLayoutName( _Out_  LPTSTR pwszKLID )
    encoded_function 'GetKeyboardLayoutName', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646299(v=vs.85).aspx
    # BOOL WINAPI GetKeyboardState( _Out_  PBYTE lpKeyState )
    attach_function 'GetKeyboardState', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724336(v=vs.85).aspx
    # int WINAPI GetKeyboardType( _In_  int nTypeFlag )
    attach_function 'GetKeyboardType', [:int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646300(v=vs.85).aspx
    # int WINAPI GetKeyNameText(
    #   _In_   LONG lParam,
    #   _Out_  LPTSTR lpString,
    #   _In_   int cchSize )
    encoded_function 'GetKeyNameText', [:long, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646301(v=vs.85).aspx
    # SHORT WINAPI GetKeyState()_In_  int nVirtKey)
    attach_function 'GetKeyState', [VirtualKeyFlags], :short

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646302(v=vs.85).aspx
    # BOOL WINAPI GetLastInputInfo( _Out_  PLASTINPUTINFO plii )
    attach_function 'GetLastInputInfo', [LASTINPUTINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646303(v=vs.85).aspx
    # BOOL WINAPI IsWindowEnabled( _In_  HWND hWnd )
    attach_function 'IsWindowEnabled', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646304(v=vs.85).aspx
    # Use SendInput instead
    # VOID WINAPI keybd_event(
    #   _In_  BYTE bVk,
    #   _In_  BYTE bScan,
    #   _In_  DWORD dwFlags,
    #   _In_  ULONG_PTR dwExtraInfo )
    attach_function 'keybd_event', [VirtualKeyFlags, :byte, KeyEventFlags, :ulong], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646305(v=vs.85).aspx
    # HKL WINAPI LoadKeyboardLayout(
    #   _In_  LPCTSTR pwszKLID,
    #   _In_  UINT Flags )
    encoded_function 'LoadKeyboardLayout', [:string, KeyboardLayoutFlags], :hkl

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646306(v=vs.85).aspx
    # UINT WINAPI MapVirtualKey(
    #   _In_  UINT uCode,
    #   _In_  UINT uMapType )
    encoded_function 'MapVirtualKey', [VirtualKeyFlags, MapVirtualKey], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646307(v=vs.85).aspx
    # UINT WINAPI MapVirtualKeyEx(
    #   _In_         UINT uCode,
    #   _In_         UINT uMapType,
    #   _Inout_opt_  HKL dwhkl )
    encoded_function 'MapVirtualKeyEx', [VirtualKeyFlags, MapVirtualKey, :hkl], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646308(v=vs.85).aspx
    # DWORD WINAPI OemKeyScan( _In_  WORD wOemChar )
    attach_function 'OemKeyScan', [:word], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
    # UINT WINAPI SendInput(
    #   _In_  UINT nInputs,
    #   _In_  LPINPUT pInputs,
    #   _In_  int cbSize )
    attach_function 'SendInput', [:uint, INPUT.ptr, :int], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646311(v=vs.85).aspx
    # HWND WINAPI SetActiveWindow( _In_  HWND hWnd )
    attach_function 'SetActiveWindow', [:hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646312(v=vs.85).aspx
    # HWND WINAPI SetFocus( _In_opt_  HWND hWnd )
    attach_function 'SetFocus', [:hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646314(v=vs.85).aspx
    # BOOL WINAPI SetKeyboardState( _In_  LPBYTE lpKeyState )
    attach_function 'SetKeyboardState', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646316(v=vs.85).aspx
    # int WINAPI ToAscii(
    #   _In_      UINT uVirtKey,
    #   _In_      UINT uScanCode,
    #   _In_opt_  const BYTE *lpKeyState,
    #   _Out_     LPWORD lpChar,
    #   _In_      UINT uFlags )
    attach_function 'ToAscii', [VirtualKeyFlags, :uint, :pointer, :pointer, :uint], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646318(v=vs.85).aspx
    # int WINAPI ToAsciiEx(
    #   _In_      UINT uVirtKey,
    #   _In_      UINT uScanCode,
    #   _In_opt_  const BYTE *lpKeyState,
    #   _Out_     LPWORD lpChar,
    #   _In_      UINT uFlags,
    #   _In_opt_  HKL dwhkl )
    attach_function 'ToAsciiEx', [VirtualKeyFlags, :uint, :pointer, :pointer, :uint, :hkl], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646320(v=vs.85).aspx
    # int WINAPI ToUnicode(
    #   _In_      UINT wVirtKey,
    #   _In_      UINT wScanCode,
    #   _In_opt_  const BYTE *lpKeyState,
    #   _Out_     LPWSTR pwszBuff,
    #   _In_      int cchBuff,
    #   _In_      UINT wFlags )
    attach_function 'ToUnicode', [VirtualKeyFlags, :uint, :pointer, :string, :int, :uint], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646322(v=vs.85).aspx
    # int WINAPI ToUnicodeEx(
    #   _In_      UINT wVirtKey,
    #   _In_      UINT wScanCode,
    #   _In_      const BYTE *lpKeyState,
    #   _Out_     LPWSTR pwszBuff,
    #   _In_      int cchBuff,
    #   _In_      UINT wFlags,
    #   _In_opt_  HKL dwhkl )
    attach_function 'ToUnicodeEx', [VirtualKeyFlags, :uint, :pointer, :string, :int, :uint, :hkl], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646324(v=vs.85).aspx
    # BOOL WINAPI UnloadKeyboardLayout( _In_  HKL hkl )
    attach_function 'UnloadKeyboardLayout', [:hkl], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646327(v=vs.85).aspx
    # BOOL WINAPI UnregisterHotKey(
    #   __in_opt  HWND hWnd,
    #   __in      int  id)
    attach_function 'UnregisterHotKey', [:hwnd, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646329(v=vs.85).aspx
    # SHORT WINAPI VkKeyScan( _In_  TCHAR ch )
    encoded_function 'VkKeyScan', [:char], :short

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646332(v=vs.85).aspx
    # SHORT WINAPI VkKeyScanEx(
    #   _In_  TCHAR ch,
    #   _In_  HKL dwhkl )
    encoded_function 'VkKeyScanEx', [:char, :hkl], :short

    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646309(v=vs.85).aspx
      # BOOL WINAPI RegisterHotKey(
      #   __in_opt  HWND hWnd,
      #   __in      int  id,
      #   __in      UINT fsModifiers,
      #   __in      UINT vk)
      attach_function 'RegisterHotKey', [:hwnd, :int, KeyboardModifiers, VirtualKeyFlags], :bool
    end
  end
end