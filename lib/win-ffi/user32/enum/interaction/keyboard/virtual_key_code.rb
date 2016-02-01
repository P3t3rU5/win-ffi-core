require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
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
      :return,                   #ENTER key
      :enter,              0x0D, #ENTER key
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
      :ins,                      #INS key
      :insert,             0x2D, #INS key
      :del,                      #DEL key
      :delete,             0x2E, #DEL key
      :help,               0x2F, #HELP
      :'0',
      :n0,                 0x30,
      :'1',
      :n1,                 0x31,
      :'2',
      :n2,                 0x32,
      :'3',
      :n3,                 0x33,
      :'4',
      :n4,                 0x34,
      :'5',
      :n5,                 0x35,
      :'6',
      :n6,                 0x36,
      :'7',
      :n7,                 0x37,
      :'8',
      :n8,                 0x38,
      :'9',
      :n9,                 0x39,
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
      :oem_ax,              0xE1,  #  'AX' key on Japanese AX kbd
      :oem_102,             0xE2, #Either the angle bracket_key or the backslash_key on the RT 102-key_keyboard,
      #                  0xE3-E4, #OEM specific
      :ico_help,            0xE3,  #  Help key on ICO
      :ico_00,              0xE4,  #  00 key on ICO
      :process,             0xE5, #IME PROCESS_key,
      #                     0xE6, #OEM specific
      :ico_clear,           0xE6,
      :packet,              0xE7, #Used to pass Unicode characters as if they were_keystrokes. The :PACKET_key is the low word of a 32-bit Virtual_key value used for non-keyboard input methods. For more information, see Remark in_keyBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
      #-,                   0xE8, #Unassigned,
      #                  0xE9-F5, #OEM specific
      #  Nokia/Ericsson definitions
      :oem_reset,   0xE9,
      :oem_jump,    0xEA,
      :oem_pa1,     0xEB,
      :oem_pa2,     0xEC,
      :oem_pa3,     0xED,
      :oem_wsctrl,  0xEE,
      :oem_cusel,   0xEF,
      :oem_attn,    0xF0,
      :oem_finish,  0xF1,
      :oem_copy,    0xF2,
      :oem_auto,    0xF3,
      :oem_enlw,    0xF4,
      :oem_backtab, 0xF5,
      :attn,        0xF6, #Attn_key
      :crsel,       0xF7, #CrSel_key
      :exsel,       0xF8, #ExSel_key
      :ereof,       0xF9, #Erase EOF_key
      :play,        0xFA, #Play_key
      :zoom,        0xFB, #Zoom_key
      :noname,      0xFC, #Reserved
      :pa1,         0xFD, #PA1_key
      :oem_clear,   0xFE
    ]

    #if(_WIN32_WINNT >= 0x0604)
    if WindowsVersion >= 10
      # 0x88 - 0x8F : UI navigation
      buffer += [
          :NAVIGATION_VIEW,   0x88,
          :NAVIGATION_MENU,   0x89,
          :NAVIGATION_UP,     0x8A,
          :NAVIGATION_DOWN,   0x8B,
          :NAVIGATION_LEFT,   0x8C,
          :NAVIGATION_RIGHT,  0x8D,
          :NAVIGATION_ACCEPT, 0x8E,
          :NAVIGATION_CANCEL, 0x8F,
          :GAMEPAD_A,                         0xC3,
          :GAMEPAD_B,                         0xC4,
          :GAMEPAD_X,                         0xC5,
          :GAMEPAD_Y,                         0xC6,
          :GAMEPAD_RIGHT_SHOULDER,            0xC7,
          :GAMEPAD_LEFT_SHOULDER,             0xC8,
          :GAMEPAD_LEFT_TRIGGER,              0xC9,
          :GAMEPAD_RIGHT_TRIGGER,             0xCA,
          :GAMEPAD_DPAD_UP,                   0xCB,
          :GAMEPAD_DPAD_DOWN,                 0xCC,
          :GAMEPAD_DPAD_LEFT,                 0xCD,
          :GAMEPAD_DPAD_RIGHT,                0xCE,
          :GAMEPAD_MENU,                      0xCF,
          :GAMEPAD_VIEW,                      0xD0,
          :GAMEPAD_LEFT_THUMBSTICK_BUTTON,    0xD1,
          :GAMEPAD_RIGHT_THUMBSTICK_BUTTON,   0xD2,
          :GAMEPAD_LEFT_THUMBSTICK_UP,        0xD3,
          :GAMEPAD_LEFT_THUMBSTICK_DOWN,      0xD4,
          :GAMEPAD_LEFT_THUMBSTICK_RIGHT,     0xD5,
          :GAMEPAD_LEFT_THUMBSTICK_LEFT,      0xD6,
          :GAMEPAD_RIGHT_THUMBSTICK_UP,       0xD7,
          :GAMEPAD_RIGHT_THUMBSTICK_DOWN,     0xD8,
          :GAMEPAD_RIGHT_THUMBSTICK_RIGHT,    0xD9,
          :GAMEPAD_RIGHT_THUMBSTICK_LEFT,     0xDA,
      ]
    end

    VirtualKeyCode = enum :virtual_key_flags, buffer
  end
end