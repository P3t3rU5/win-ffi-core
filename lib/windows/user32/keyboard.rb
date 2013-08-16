module WinFFI
  module User32
    module Keyboard
      extend LibBase
      ffi_lib 'user32'

      KeyboardLayoutFlags = enum :keyboard_layout_flags, [
          :ACTIVATE, 0x00000001, # If the specified input locale identifier is not already loaded, the function loads
          # and activates the input locale identifier for the current thread.

          :SUBSTITUTE_OK, 0x00000002, # Substitutes the specified input locale identifier with another locale preferred
          # by the user. The system starts with this flag set, and it is recommended that your application always use
          # this flag. The substitution occurs only if the registry key HKEY_CURRENT_USER\Keyboard\Layout\Substitutes
          # explicitly defines a substitution locale. For example, if the key includes the value name "00000409" with
          # value "00010409", loading the U.S. English layout ("00000409") causes the Dvorak U.S. English layout
          # ("00010409") to be loaded instead. The system uses :SUBSTITUTE_OK when booting, and it is recommended that
          # all applications use this value when loading input locale identifiers to ensure that the user's preference
          # is selected.

          :REORDER, 0x00000008, # If this bit is set, the system's circular list of loaded locale identifiers is
          # reordered by moving the locale identifier to the head of the list. If this bit is not set, the list is rotated
          # without a change of order. For example, if a user had an English locale identifier active, as well as having
          # French, German, and Spanish locale identifiers loaded (in that order), then activating the German locale
          # identifier with the KLF_REORDER bit set would produce the following order: German, English, French, Spanish.
          # Activating the German locale identifier without the KLF_REORDER bit set would produce the following order:
          # German, Spanish, English, French. If less than three locale identifiers are loaded, the value of this flag is
          # irrelevant.

          :REPLACELANG, 0x00000010, # If the new input locale identifier has the same language identifier as a current
          # input locale identifier, the new input locale identifier replaces the current one as the input locale
          # identifier for that language. If this value is not provided and the input locale identifiers have the same
          # language identifiers, the current input locale identifier is not replaced and the function returns NULL.

          :NOTELLSHELL, 0x00000080, # Prevents a ShellProc hook procedure from receiving an HSHELL_LANGUAGE hook code when
          # the new input locale identifier is loaded. This value is typically used when an application loads multiple
          # input locale identifiers one after another. Applying this value to all but the last input locale identifier
          # delays the shell's processing until all input locale identifiers have been added.


          :SETFORPROCESS, 0x00000100, #This flag is valid only with :ACTIVATE. Activates the specified input locale
          # identifier for the entire process and sends the WM_INPUTLANGCHANGE message to the current thread's Focus or
          # Active window. Typically, LoadKeyboardLayout activates an input locale identifier only for the current thread.

          :SHIFTLOCK, 0x00010000, # This is used with KLF_RESET. See KLF_RESET for an explanation.
          #KLF_UNLOADPREVIOUS #This flag is unsupported. Use the UnloadKeyboardLayout function instead.

          :RESET, 0x40000000, # If set but KLF_SHIFTLOCK is not set, the Caps Lock state is turned off by pressing the
                              # Caps Lock key again. If set and KLF_SHIFTLOCK is also set, the Caps Lock state is turned off by pressing
                              # either SHIFT key. These two methods are mutually exclusive, and the setting persists as part of the User's
                              # profile in the registry.
      ]


      KeyEventFlags = enum :key_event_flags, [
          :EXTENDEDKEY, 0x0001, # If specified, the scan code was preceded by a prefix byte having the value 0xE0 (224).
          :KEYUP, 0x0002, # If specified, the key is being released. If not specified, the key is being depressed.
      ]


      MapVirtualKey = enum :map_virtual_key, [
          :VK_TO_VSC, 0, # uCode is a virtual-key code and is translated into a scan code. If it is a virtual-key code t
          # hat does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is
          # no translation, the function returns 0.

          :VSC_TO_VK, 1, #uCode is a scan code and is translated into a virtual-key code that does not distinguish between
          # left-hand right-hand keys. If there is no translation, the function returns 0.

          :VK_TO_CHAR, 2, # uCode is a virtual-key code and is translated into an unshifted character value in the
          # low-order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return
          # value. If there is no translation, the function returns 0.

          :VSC_TO_VK_EX, 3, # uCode is a scan code and is translated into a virtual-key code that distinguishes between
                            # left- and right-hand keys. If there is no translation, the function returns 0.
      ]

      Modifiers = enum :modifiers, [
          :alt,      0x0001, #Either ALT key must be held down.
          :control,  0x0002, #Either CTRL key must be held down.
          :ctrl,     0x0002,
          :norepeat, 0x4000, #Changes the hotkey behavior so that the keyboard auto-repeat does not yield multiple hotkey notifications.
          #Windows Vista and Windows XP/2000:  This flag is not supported.
          :shift,    0x0004, #Either SHIFT key must be held down.
          :windows,  0x0008, #Either WINDOWS key was held down. These keys are labeled with the Windows logo. Keyboard shortcuts that involve the WINDOWS key are reserved for use by the operating system.
      ]


      VirtualKeyFlags = enum :key_flags, [
          :lbutton,            0x01, #Left mouse button
          :rbutton,            0x02, #Right mouse button
          :cancel,             0x03, #Control-break processing
          :mbutton,            0x04, #Middle mouse button (three-button mouse)
          :xbutton1,           0x05, #X1 mouse button
          :xbutton2,           0x06, #X2 mouse button
          #-,                  0x07, #Undefined
          :backspace,          0x08, #BACKSPACE key
          :tab,                0x09, #TAB key
          #-,               0x0A-0B, #Reserved
          :clear,              0x0C, #CLEAR key
          :enter,              0x0D, #ENTER key
          #:return,             0x0D, #ENTER key
          #-,               0x0E-0F, #Undefined
          :shift,              0x10, #SHIFT key
          :control,            0x11, #CTRL key
          :menu,               0x12, #ALT key
          :pause,              0x13, #PAUSE key
          :capital,            0x14, #CAPS LOCK key
          :kana,               0x15, #IME Kana mode
          :hanguel,            0x15, #IME Hanguel mode (maintained for compatibility; use :HANGUL)
          :hangul,             0x15, #IME Hangul mode
          #-,                  0x16, #Undefined
          :junja,              0x17, #IME Junja mode
          :final,              0x18, #IME final mode
          :hanja,              0x19, #IME Hanja mode
          :kanji,              0x19, #IME Kanji mode
          #-,                  0x1A, #Undefined
          :esc,                0x1B, #ESC key
          #:escape,             0x1B, #ESC key
          :convert,            0x1C, #IME convert
          :nonconvert,         0x1D, #IME nonconvert
          :accept,             0x1E, #IME accept
          :modechange,         0x1F, #IME mode change request
          :space,              0x20, #SPACEBAR
          :prior,              0x21, #PAGE UP key
          :next,               0x22, #PAGE DOWN key
          :end,                0x23, #END key
          :home,               0x24, #HOME key
          :left,               0x25, #LEFT ARROW key
          :up,                 0x26, #UP ARROW key
          :right,              0x27, #RIGHT ARROW key
          :down,               0x28, #DOWN ARROW key
          :select,             0x29, #SELECT key
          :print,              0x2A, #PRINT key
          :execute,            0x2B, #EXECUTE key
          :snapshot,           0x2C, #PRINT SCREEN key
          :ins,                0x2D, #INS key
          :insert,             0x2D, #INS key
          :del,                0x2E, #DEL key
          :delete,             0x2E, #DEL key
          :help,               0x2F, #HELP
          :n0,                 0x30,
          :n1,                 0x31,
          :n2,                 0x32,
          :n3,                 0x33,
          :n4,                 0x34,
          :n5,                 0x35,
          :n6,                 0x36,
          :n7,                 0x37,
          :n8,                 0x38,
          :n9,                 0x39,
          :'0',                0x30,
          :'1',                0x31,
          :'2',                0x32,
          :'3',                0x33,
          :'4',                0x34,
          :'5',                0x35,
          :'6',                0x36,
          :'7',                0x37,
          :'8',                0x38,
          :'9',                0x39,
          #-,                  0x3A-40, #Undefined,
          :a,                  0x41,
          :b,                  0x42,
          :c,                  0x43,
          :d,                  0x44,
          :e,                  0x45,
          :f,                  0x46,
          :g,                  0x47,
          :h,                  0x48,
          :i,                  0x49,
          :j,                  0x4A,
          :k,                  0x4B,
          :l,                  0x4C,
          :m,                  0x4D,
          :n,                  0x4E,
          :o,                  0x4F,
          :p,                  0x50,
          :q,                  0x51,
          :r,                  0x52,
          :s,                  0x53,
          :t,                  0x54,
          :u,                  0x55,
          :v,                  0x56,
          :w,                  0x57,
          :x,                  0x58,
          :y,                  0x59,
          :z,                  0x5A,
          :lwin,               0x5B, #Left Windows key (Natural keyboard)
          :rwin,               0x5C, #Right Windows_key (Natural keyboard)
          :apps,               0x5D, #Applications_key (Natural keyboard)
          #-,                  0x5E, #Reserved
          :sleep,              0x5F, #Computer Sleep key
          :numpad0,            0x60, #Numeric keypad 0 key
          :numpad1,            0x61, #Numeric keypad 1 key
          :numpad2,            0x62, #Numeric keypad 2 key
          :numpad3,            0x63, #Numeric keypad 3 key
          :numpad4,            0x64, #Numeric keypad 4 key
          :numpad6,            0x66, #Numeric keypad 6 key
          :numpad7,            0x67, #Numeric keypad 7 key
          :numpad8,            0x68, #Numeric keypad 8 key
          :numpad5,            0x65, #Numeric keypad 5 key
          :numpad9,            0x69, #Numeric keypad 9 key
          :multiply,           0x6A, #Multiply key
          :add,                0x6B, #Add key
          :separator,          0x6C, #Separator key
          :subtract,           0x6D, #Subtract key
          :decimal,            0x6E, #Decimal key
          :divide,             0x6F, #Divide key
          :f1,                 0x70, #F1_key
          :f2,                 0x71, #F2_key
          :f3,                 0x72, #F3_key
          :f4,                 0x73, #F4_key
          :f5,                 0x74, #F5_key
          :f6,                 0x75, #F6_key
          :f7,                 0x76, #F7_key
          :f8,                 0x77, #F8_key
          :f9,                 0x78, #F9_key
          :f10,                0x79, #F10_key
          :f11,                0x7A, #F11_key
          :f12,                0x7B, #F12_key
          :f13,                0x7C, #F13_key
          :f14,                0x7D, #F14_key
          :f15,                0x7E, #F15_key
          :f16,                0x7F, #F16_key
          :f17,                0x80, #F17_key
          :f18,                0x81, #F18_key
          :f19,                0x82, #F19_key
          :f20,                0x83, #F20_key
          :f21,                0x84, #F21_key
          :f22,                0x85, #F22_key
          :f23,                0x86, #F23_key
          :f24,                0x87, #F24_key
          #-,               0x88-8F, #Unassigned
          :numlock,            0x90, #NUM LOCK_key
          :scroll,             0x91, #SCROLL LOCK_key,
          #                 0x92-96, #OEM specific
          #-,               0x97-9F, #Unassigned
          :lshift,              0xA0, #Left SHIFT_key
          :rshift,              0xA1, #Right SHIFT_key
          :lcontrol,            0xA2, #Left CONTROL_key
          :rcontrol,            0xA3, #Right CONTROL_key
          :lmenu,               0xA4, #Left MENU_key
          :rmenu,               0xA5, #Right MENU_key
          :browser_back,        0xA6, #Browser Back_key
          :browser_forward,     0xA7, #Browser Forward_key
          :browser_refresh,     0xA8, #Browser Refresh_key
          :browser_stop,        0xA9, #Browser Stop_key
          :browser_search,      0xAA, #Browser Search_key
          :browser_favorites,   0xAB, #Browser Favorites_key
          :browser_home,        0xAC, #Browser Start and Home_key
          :volume_mute,         0xAD, #Volume Mute_key
          :volume_down,         0xAE, #Volume Down_key
          :volume_up,           0xAF, #Volume Up_key
          :media_next_track,    0xB0, #Next Track_key
          :media_prev_track,    0xB1, #Previous Track_key
          :media_stop,          0xB2, #Stop Media_key
          :media_play_pause,    0xB3, #Play/Pause Media_key
          :launch_mail,         0xB4, #Start Mail_key
          :launch_media_select, 0xB5, #Select Media_key
          :launch_app1,         0xB6, #Start Application 1_key
          :launch_app2,         0xB7, #Start Application 2_key
          #-,                0xB8-B9, Reserved
          :oem_1,               0xBA, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the ';:'_key
          :oem_plus,            0xBB, #For any country/region, the '+'_key
          :oem_comma,           0xBC, #For any country/region, the ','_key
          :oem_minus,           0xBD, #For any country/region, the '-'_key
          :oem_period,          0xBE, #For any country/region, the '.'_key
          :oem_2,               0xBF, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the '/?'_key
          :oem_3,               0xC0, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the '`~'_key
          #-,                0xC1-D7, Reserved
          #-,                0xD8-DA, Assigned
          :oem_4,               0xDB, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the '[{'_key
          :oem_5,               0xDC, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the '\|'_key
          :oem_6,               0xDD, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the ']}'_key
          :oem_7,               0xDE, #Used for miscellaneous characters; it can vary by_keyboard. For the US standard_keyboard, the 'single-quote/double-quote'_key
          :oem_8,               0xDF, #Used for miscellaneous characters; it can vary by_keyboard.
          #-,                   0xE0, Reserved
          #                     0xE1, OEM Specific
          :oem_102,             0xE2, #Either the angle bracket_key or the backslash_key on the RT 102-key_keyboard,
          #                  0xE3-E4, #OEM specific
          :process,             0xE5, #IME PROCESS_key,
          #                     0xE6, #OEM specific
          :packet,              0xE7, #Used to pass Unicode characters as if they were_keystrokes. The :PACKET_key is the low word of a 32-bit Virtual_key value used for non-keyboard input methods. For more information, see Remark in_keyBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
          #-,                   0xE8, #Unassigned,
          #                  0xE9-F5, #OEM specific
          :attn,                0xF6, #Attn_key
          :crsel,               0xF7, #CrSel_key
          :exsel,               0xF8, #ExSel_key
          :ereof,               0xF9, #Erase EOF_key
          :play,                0xFA, #Play_key
          :zoom,                0xFB, #Zoom_key
          :noname,              0xFC, #Reserved
          :pa1,                 0xFD, #PA1_key
      ]


      class LASTINPUTINFO < FFI::Struct
        layout :cbSize, :uint,
               :dwTime, :dword
      end

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
      attach_function 'RegisterHotKey', [:hwnd, :int, Modifiers, VirtualKeyFlags], :bool

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

      def self.shift?
        (GetKeyState(VirtualKeyFlags[:shift]) & 0x8000) != 0
      end

      def self.control?
        (GetKeyState(VirtualKeyFlags[:ctrl]) & 0x8000) != 0
      end

      def self.alt?
        (GetKeyState(VirtualKeyFlags[:alt]) & 0x8000) != 0
      end

    end
  end
end