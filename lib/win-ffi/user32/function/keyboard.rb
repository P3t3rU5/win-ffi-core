require 'win-ffi/user32'

require 'win-ffi/user32/enum/keyboard_layout_flags'
require 'win-ffi/user32/enum/virtual_key_flags'
require 'win-ffi/user32/enum/keyboard_modifiers'
require 'win-ffi/user32/enum/map_virtual_key'
require 'win-ffi/user32/enum/key_event_flags'

require 'win-ffi/user32/struct/last_input_info'
require 'win-ffi/user32/struct/input'

module WinFFI
  module User32

    typedef :pointer, :hkl

    #HKL WINAPI ActivateKeyboardLayout( _In_  HKL hkl, _In_  UINT Flags )
    attach_function 'ActivateKeyboardLayout', [:hkl, KeyboardLayoutFlags], :hkl

    #BOOL WINAPI BlockInput( _In_  BOOL fBlockIt )
    attach_function 'BlockInput', [:bool], :bool

    #BOOL WINAPI EnableWindow(
    #  __in HWND hWnd,
    #  __in BOOL bEnable)
    attach_function 'EnableWindow', [:hwnd, :bool], :bool

    #HWND WINAPI GetActiveWindow(void);
    attach_function 'GetActiveWindow', [], :hwnd

    #SHORT WINAPI GetAsyncKeyState#(_In_  int vKey)
    attach_function 'GetAsyncKeyState', [VirtualKeyFlags], :short

    #HWND WINAPI GetFocus(void)
    attach_function 'GetFocus', [], :hwnd

    #UINT WINAPI GetKBCodePage(void)
    attach_function 'GetKBCodePage', [], :uint

    #HKL WINAPI GetKeyboardLayout( _In_  DWORD idThread )
    attach_function 'GetKeyboardLayout', [:dword], :hkl

    #int WINAPI GetKeyboardLayoutList(
    #  _In_   int nBuff,
    #  _Out_  HKL *lpList )
    attach_function 'GetKeyboardLayoutList', [:int, :hkl], :int

    #BOOL WINAPI GetKeyboardLayoutName( _Out_  LPTSTR pwszKLID )
    encoded_function 'GetKeyboardLayoutName', [:string], :bool

    #BOOL WINAPI GetKeyboardState( _Out_  PBYTE lpKeyState )
    attach_function 'GetKeyboardState', [:pointer], :bool

    #int WINAPI GetKeyboardType( _In_  int nTypeFlag )
    attach_function 'GetKeyboardType', [:int], :int

    #int WINAPI GetKeyNameText(
    #  _In_   LONG lParam,
    #  _Out_  LPTSTR lpString,
    #  _In_   int cchSize )
    encoded_function 'GetKeyNameText', [:long, :string, :int], :int

    #SHORT WINAPI GetKeyState()_In_  int nVirtKey)
    attach_function 'GetKeyState', [VirtualKeyFlags], :short

    #BOOL WINAPI GetLastInputInfo( _Out_  PLASTINPUTINFO plii )
    attach_function 'GetLastInputInfo', [LASTINPUTINFO.ptr], :bool

    #BOOL WINAPI IsWindowEnabled( _In_  HWND hWnd )
    attach_function 'IsWindowEnabled', [:hwnd], :bool

    #Use SendInput instead
    #VOID WINAPI keybd_event(
    #  _In_  BYTE bVk,
    #  _In_  BYTE bScan,
    #  _In_  DWORD dwFlags,
    #  _In_  ULONG_PTR dwExtraInfo )
    attach_function 'keybd_event', [VirtualKeyFlags, :byte, KeyEventFlags, :ulong], :void

    #HKL WINAPI LoadKeyboardLayout(
    #  _In_  LPCTSTR pwszKLID,
    #  _In_  UINT Flags )
    encoded_function 'LoadKeyboardLayout', [:string, KeyboardLayoutFlags], :hkl

    #UINT WINAPI MapVirtualKey(
    #  _In_  UINT uCode,
    #  _In_  UINT uMapType )
    encoded_function 'MapVirtualKey', [VirtualKeyFlags, MapVirtualKey], :uint

    #UINT WINAPI MapVirtualKeyEx(
    #  _In_         UINT uCode,
    #  _In_         UINT uMapType,
    #  _Inout_opt_  HKL dwhkl )
    encoded_function 'MapVirtualKeyEx', [VirtualKeyFlags, MapVirtualKey, :hkl], :uint

    #DWORD WINAPI OemKeyScan( _In_  WORD wOemChar )
    attach_function 'OemKeyScan', [:word], :dword

    #BOOL WINAPI RegisterHotKey(
    #  __in_opt  HWND hWnd,
    #  __in      int  id,
    #  __in      UINT fsModifiers,
    #  __in      UINT vk)
    attach_function 'RegisterHotKey', [:hwnd, :int, KeyboardModifiers, VirtualKeyFlags], :bool

    #UINT WINAPI SendInput(
    #  _In_  UINT nInputs,
    #  _In_  LPINPUT pInputs,
    #  _In_  int cbSize )
    attach_function 'SendInput', [:uint, INPUT.ptr, :int], :uint

    #HWND WINAPI SetActiveWindow( _In_  HWND hWnd )
    attach_function 'SetActiveWindow', [:hwnd], :hwnd

    #HWND WINAPI SetFocus( _In_opt_  HWND hWnd )
    attach_function 'SetFocus', [:hwnd], :hwnd

    #BOOL WINAPI SetKeyboardState( _In_  LPBYTE lpKeyState )
    attach_function 'SetKeyboardState', [:pointer], :bool

    #int WINAPI ToAscii(
    #  _In_      UINT uVirtKey,
    #  _In_      UINT uScanCode,
    #  _In_opt_  const BYTE *lpKeyState,
    #  _Out_     LPWORD lpChar,
    #  _In_      UINT uFlags )
    attach_function 'ToAscii', [VirtualKeyFlags, :uint, :pointer, :pointer, :uint], :int

    #int WINAPI ToAsciiEx(
    #  _In_      UINT uVirtKey,
    #  _In_      UINT uScanCode,
    #  _In_opt_  const BYTE *lpKeyState,
    #  _Out_     LPWORD lpChar,
    #  _In_      UINT uFlags,
    #  _In_opt_  HKL dwhkl )
    attach_function 'ToAsciiEx', [VirtualKeyFlags, :uint, :pointer, :pointer, :uint, :hkl], :int

    #int WINAPI ToUnicode(
    #  _In_      UINT wVirtKey,
    #  _In_      UINT wScanCode,
    #  _In_opt_  const BYTE *lpKeyState,
    #  _Out_     LPWSTR pwszBuff,
    #  _In_      int cchBuff,
    #  _In_      UINT wFlags )
    attach_function 'ToUnicode', [VirtualKeyFlags, :uint, :pointer, :string, :int, :uint], :int

    #int WINAPI ToUnicodeEx(
    #  _In_      UINT wVirtKey,
    #  _In_      UINT wScanCode,
    #  _In_      const BYTE *lpKeyState,
    #  _Out_     LPWSTR pwszBuff,
    #  _In_      int cchBuff,
    #  _In_      UINT wFlags,
    #  _In_opt_  HKL dwhkl )
    attach_function 'ToUnicodeEx', [VirtualKeyFlags, :uint, :pointer, :string, :int, :uint, :hkl], :int

    #BOOL WINAPI UnloadKeyboardLayout( _In_  HKL hkl )
    attach_function 'UnloadKeyboardLayout', [:hkl], :bool

    #BOOL WINAPI UnregisterHotKey(
    #  __in_opt  HWND hWnd,
    #  __in      int  id)
    attach_function 'UnregisterHotKey', [:hwnd, :int], :bool

    #SHORT WINAPI VkKeyScan( _In_  TCHAR ch )
    encoded_function 'VkKeyScan', [:char], :short

    #SHORT WINAPI VkKeyScanEx(
    #  _In_  TCHAR ch,
    #  _In_  HKL dwhkl )
    encoded_function 'VkKeyScanEx', [:char, :hkl], :short
  end
end