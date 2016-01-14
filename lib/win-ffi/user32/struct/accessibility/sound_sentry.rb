require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_flags'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_text_flags'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_graph_flags'
require 'win-ffi/user32/enum/accessibility/flag/sound_sentry_window_flags'


module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373646(v=vs.85).aspx
    class SOUNDSENTRY < FFIStruct
      layout :cbSize,                 :uint,
             :dwFlags,                SoundSentryFlags,
             :iFSTextEffect,          SoundSentryTextFlags,
             :iFSTextEffectMSec,      :dword,
             :iFSTextEffectColorBits, :dword,
             :iFSGrafEffect,          SoundSentryGraphFlags,
             :iFSGrafEffectMSec,      :dword,
             :iFSGrafEffectColor,     :dword,
             :iWindowsEffect,         SoundSentryWindowFlags,
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