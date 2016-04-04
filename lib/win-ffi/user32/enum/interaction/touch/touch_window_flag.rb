require 'win-ffi/user32'

module WinFFI
  module User32
    # RegisterTouchWindow flag values
    TouchWindowFlag = enum :touch_window_flag, [
        :FINETOUCH, 0x00000001, # Specifies that hWnd prefers noncoalesced touch input.
        :WANTPALM,  0x00000002  # Setting this flag disables palm rejection which reduces delays for getting WM_TOUCH messages. This is useful if you want as quick of a response as possible when a user touches your application.
    # By default, palm detection is enabled and some WM_TOUCH messages are prevented from being sent to your application. This is useful if you do not want to receive WM_TOUCH messages that are from palm contact.
    ]
  end
end