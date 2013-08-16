module WinFFI
  module User32
    module Input
      extend LibBase

      ffi_lib 'user32'

      FEEDBACK_TYPE = enum :feedback_type, [
          :TOUCH_CONTACTVISUALIZATION, 1,
          :PEN_BARRELVISUALIZATION,    2,
          :PEN_TAP,                    3,
          :PEN_DOUBLETAP,              4,
          :PEN_PRESSANDHOLD,           5,
          :PEN_RIGHTTAP,               6,
          :TOUCH_TAP,                  7,
          :TOUCH_DOUBLETAP,            8,
          :TOUCH_PRESSANDHOLD,         9,
          :TOUCH_RIGHTTAP,             10,
          :GESTURE_PRESSANDTAP,        11,
          :MAX,                        0xFFFFFFFF
      ]

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