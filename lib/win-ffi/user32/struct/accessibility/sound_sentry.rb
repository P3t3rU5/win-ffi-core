require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_flag'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_text_flag'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_graph_flag'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_window_flag'


module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373646(v=vs.85).aspx
    class SOUNDSENTRY < FFIStruct
      layout :cbSize,                 :uint,
             :dwFlags,                SoundSentryFlag,
             :iFSTextEffect,          SoundSentryTextFlag,
             :iFSTextEffectMSec,      :dword,
             :iFSTextEffectColorBits, :dword,
             :iFSGrafEffect,          SoundSentryGraphFlag,
             :iFSGrafEffectMSec,      :dword,
             :iFSGrafEffectColor,     :dword,
             :iWindowsEffect,         SoundSentryWindowFlag,
             :iWindowsEffectMSec,     :dword,
             :lpszWindowsEffectDLL,   :string,
             :iWindowsEffectOrdinal,  :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end