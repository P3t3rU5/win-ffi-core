require 'win-ffi/user32'

require 'win-ffi/user32/enum/feedback_type'

module WinFFI
  module User32
    if WindowsVersion >= 8
      #BOOL WINAPI GetWindowFeedbackSetting(
      #  _In_       HWND hwnd,
      #  _In_       FEEDBACK_TYPE feedback,
      #  _In_       DWORD dwFlags,
      #  _Inout_    UINT32 *pSize,
      #  _Out_opt_  VOID *config )
      attach_function 'GetWindowFeedbackSetting', [:hwnd, FEEDBACK_TYPE, :dword, :pointer, :pointer], :bool

      #BOOL WINAPI SetWindowFeedbackSetting(
      #  _In_      HWND hwnd,
      #  _In_      FEEDBACK_TYPE feedback,
      #  _In_      DWORD dwFlags,
      #  _In_      UINT32 size,
      #  _In_opt_  const VOID *configuration )
      attach_function 'SetWindowFeedbackSetting', [:hwnd, FEEDBACK_TYPE, :dword, :uint32, :pointer], :bool
    end
  end
end