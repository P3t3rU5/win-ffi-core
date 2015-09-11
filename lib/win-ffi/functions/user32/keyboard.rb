require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/keyboard_layout_flags'
require 'win-ffi/enums/user32/virtual_key_flags'
require 'win-ffi/enums/user32/keyboard_modifiers'
require 'win-ffi/enums/user32/map_virtual_key'
require 'win-ffi/enums/user32/key_event_flags'

require 'win-ffi/structs/user32/last_input_info'

module WinFFI
  module User32
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
    attach_function 'GetKeyboardLayoutNameA', [:string], :bool
    attach_function 'GetKeyboardLayoutNameW', [:string], :bool

    #BOOL WINAPI GetKeyboardState( _Out_  PBYTE lpKeyState )
    attach_function 'GetKeyboardState', [:pointer], :bool

    #int WINAPI GetKeyboardType( _In_  int nTypeFlag )
    attach_function 'GetKeyboardType', [:int], :int

    #int WINAPI GetKeyNameText(
    #  _In_   LONG lParam,
    #  _Out_  LPTSTR lpString,
    #  _In_   int cchSize )
    attach_function 'GetKeyNameTextA', [:long, :string, :int], :int
    attach_function 'GetKeyNameTextW', [:long, :string, :int], :int

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
    attach_function 'LoadKeyboardLayoutA', [:string, KeyboardLayoutFlags], :hkl
    attach_function 'LoadKeyboardLayoutW', [:string, KeyboardLayoutFlags], :hkl

    #UINT WINAPI MapVirtualKey(
    #  _In_  UINT uCode,
    #  _In_  UINT uMapType )
    attach_function 'MapVirtualKeyA', [VirtualKeyFlags, MapVirtualKey], :uint
    attach_function 'MapVirtualKeyW', [VirtualKeyFlags, MapVirtualKey], :uint

    #UINT WINAPI MapVirtualKeyEx(
    #  _In_         UINT uCode,
    #  _In_         UINT uMapType,
    #  _Inout_opt_  HKL dwhkl )
    attach_function 'MapVirtualKeyExA', [VirtualKeyFlags, MapVirtualKey, :hkl], :uint
    attach_function 'MapVirtualKeyExW', [VirtualKeyFlags, MapVirtualKey, :hkl], :uint

    #DWORD WINAPI OemKeyScan( _In_  WORD wOemChar )
    attach_function 'OemKeyScan', [:word], :dword

    #BOOL WINAPI RegisterHotKey(
    #  __in_opt  HWND hWnd,
    #  __in      int  id,
    #  __in      UINT fsModifiers,
    #  __in      UINT vk)
    attach_function 'RegisterHotKey', [:hwnd, :int, KeyboardModifiers, VirtualKeyFlags], :bool

    #TODO
    #UINT WINAPI SendInput(
    #  _In_  UINT nInputs,
    #  _In_  LPINPUT pInputs,
    #  _In_  int cbSize )
    attach_function 'SendInput', [:uint, :pointer, :int], :uint

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
    attach_function 'ToUnicodeEx', [:uint, :uint, :pointer, :string, :int, :uint, :hkl], :int

    #BOOL WINAPI UnloadKeyboardLayout( _In_  HKL hkl )
    attach_function 'UnloadKeyboardLayout', [:hkl], :bool

    #BOOL WINAPI UnregisterHotKey(
    #  __in_opt  HWND hWnd,
    #  __in      int  id)
    attach_function 'UnregisterHotKey', [:hwnd, :int], :bool

    #SHORT WINAPI VkKeyScan( _In_  TCHAR ch )
    attach_function 'VkKeyScanA', [:char], :short
    attach_function 'VkKeyScanW', [:char], :short

    #SHORT WINAPI VkKeyScanEx(
    #  _In_  TCHAR ch,
    #  _In_  HKL dwhkl )
    attach_function 'VkKeyScanExA', [:char, :hkl], :short
    attach_function 'VkKeyScanExW', [:char, :hkl], :short
  end
end