require 'win-ffi/user32'

require 'win-ffi/user32/enum/pointer_input_type'

require 'win-ffi/user32/struct/interaction/pointer_info'
require 'win-ffi/user32/struct/interaction/pointer_pen_info'
require 'win-ffi/user32/struct/interaction/pointer_touch_info'
require 'win-ffi/user32/struct/interaction/pointer_device_info'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh447467(v=vs.85).aspx
      # BOOL WINAPI EnableMouseInPointer( _In_  BOOL fEnable )
      attach_function 'EnableMouseInPointer', [:bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454878(v=vs.85).aspx
      # BOOL WINAPI GetPointerCursorId (
      #   _In_   UINT32 pointerId,
      #   _Out_  UINT32 *cursorId )
      attach_function 'GetPointerCursorId', [:uint32, :uint32], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437261(v=vs.85).aspx
      # WINUSERAPI BOOL WINAPI WINAPI GetPointerDevice(
      #   _In_   HANDLE device,
      #   _Out_  POINTER_DEVICE_INFO *pointerDevice )
      attach_function 'GetPointerDevice', [:handle, POINTER_DEVICE_INFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802884(v=vs.85).aspx
      # BOOL GetPointerDeviceCursors(
      #  _In_       HANDLE device,
      #  _Inout_    UINT32 *cursorCount,
      #  _Out_opt_  POINTER_DEVICE_CURSOR_INFO *deviceCursors )
      attach_function 'GetPointerDeviceCursors', [:handle, :uint, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802885(v=vs.85).aspx
      # BOOL GetPointerDeviceProperties(
      #   _In_       HANDLE device,
      #   _Inout_    UINT32 *propertyCount,
      #   _Out_opt_  POINTER_DEVICE_PROPERTY *pointerProperties )
      attach_function 'GetPointerDeviceProperties', [:handle, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802886(v=vs.85).aspx
      # BOOL GetPointerDeviceRects(
      #   _In_   HANDLE device,
      #   _Out_  RECT *pointerDeviceRect,
      #   _Out_  RECT *displayRect )
      attach_function 'GetPointerDeviceRects', [:handle, RECT.ptr, RECT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437265(v=vs.85).aspx
      # WINUSERAPI BOOL WINAPI WINAPI GetPointerDevices(
      #   _Inout_    UINT32 deviceCount,
      #   _Out_opt_  POINTER_DEVICE_INFO *pointerDevices )
      attach_function 'GetPointerDevices', [:uint32, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454879(v=vs.85).aspx
      # BOOL WINAPI GetPointerFrameInfo(
      #   _In_     UINT32 pointerId,
      #   _Inout_  UINT32 *pointerCount,
      #   _Out_    POINTER_INFO *pointerInfo )
      attach_function 'GetPointerFrameInfo', [:uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454880(v=vs.85).aspx
      # BOOL WINAPI GetPointerFrameInfoHistory(
      #   _In_     UINT32 pointerId,
      #   _Inout_  UINT32 *entriesCount,
      #   _Inout_  UINT32 *pointerCount,
      #   _Out_    POINTER_INFO * pointerInfo )
      attach_function 'GetPointerFrameInfoHistory', [:uint32, :pointer, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454881(v=vs.85).aspx
      # BOOL WINAPI GetPointerFramePenInfo(
      #   _In_     UINT32 pointerId,
      #   _Inout_  UINT32 *pointerCount,
      #   _Out_    POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerFramePenInfo', [:uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454881(v=vs.85).aspx
      # BOOL WINAPI GetPointerFramePenInfoHistory(
      #   _In_       UINT32 pointerId,
      #   _Inout_    UINT32 *entriesCount,
      #   _Inout_    UINT32 *pointerCount,
      #   _Out_opt_  POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerFramePenInfoHistory', [:uint32, :pointer, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454883(v=vs.85).aspx
      # BOOL WINAPI GetPointerFrameTouchInfo(
      #   _In_     UINT32 pointerId,
      #   _Inout_  UINT32 *pointerCount,
      #   _Out_    POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerFrameTouchInfo', [:uint32, :pointer, POINTER_TOUCH_INFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454884(v=vs.85).aspx
      # BOOL WINAPI GetPointerFrameTouchInfoHistory(
      #   _In_     UINT32 pointerId,
      #   _Inout_  UINT32 *entriesCount,
      #   _Inout_  UINT32 *pointerCount,
      #   _Out_    POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerFrameTouchInfoHistory', [:uint32, :pointer, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454885(v=vs.85).aspx
      # BOOL WINAPI GetPointerInfo(
      #   _In_   UINT32 pointerId,
      #   _Out_  POINTER_INFO *pointerInfo )
      attach_function 'GetPointerInfo', [:uint32, POINTER_INFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454886(v=vs.85).aspx
      # BOOL WINAPI GetPointerInfoHistory(
      #   _In_       UINT32 pointerId,
      #   _Inout_    UINT32 *entriesCount,
      #   _Out_opt_  POINTER_INFO *pointerInfo )
      attach_function 'GetPointerInfoHistory', [:uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn280576(v=vs.85).aspx
      # BOOL WINAPI GetPointerInputTransform(
      #   _In_   UINT32 pointerId,
      #   _In_   UINT32 historyCount,
      #   _Out_  UINT32 *inputTransform )
      attach_function 'GetPointerInputTransform', [:uint, :uint, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454887(v=vs.85).aspx
      # BOOL WINAPI GetPointerPenInfo(
      #   _In_   UINT32 pointerId,
      #   _Out_  POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerPenInfo', [:uint32, POINTER_PEN_INFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454889(v=vs.85).aspx
      # BOOL WINAPI GetPointerPenInfoHistory(
      #   _In_       UINT32 pointerId,
      #   _Inout_    UINT32 *entriesCount,
      #   _Out_opt_  POINTER_PEN_INFO  *penInfo )
      attach_function 'GetPointerPenInfoHistory', [:uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454890(v=vs.85).aspx
      # BOOL WINAPI GetPointerTouchInfo(
      #   _In_   UINT32 pointerId,
      #   _Out_  POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerTouchInfo', [:uint32, POINTER_TOUCH_INFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454891(v=vs.85).aspx
      # BOOL WINAPI GetPointerTouchInfoHistory(
      #   _In_       UINT32 pointerId,
      #   _Inout_    UINT32 *entriesCount,
      #   _Out_opt_  POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerTouchInfoHistory', [:uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454892(v=vs.85).aspx
      # BOOL WINAPI GetPointerType (
      #   _In_   UINT32 pointerId,
      #   _Out_  POINTER_INPUT_TYPE *pointerType )
      attach_function 'GetPointerType', [:uint32, POINTER_INPUT_TYPE], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802887(v=vs.85).aspx
      # BOOL GetRawPointerDeviceData(
      #   _In_   UINT32 pointerId,
      #   _In_   UINT32 historyCount,
      #   _In_   UINT32 propertiesCount,
      #   _In_   POINTER_DEVICE_PROPERTY *pProperties,
      #   _Out_  LONG *pValues )
      attach_function 'GetRawPointerDeviceData', [:uint32, :uint32, :uint32, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969204(v=vs.85).aspx
      # DWORD WINAPI GetUnpredictedMessagePos(void)
      attach_function 'GetUnpredictedMessagePos', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh580752(v=vs.85).aspx
      # BOOL WINAPI IsMouseInPointerEnabled(void)
      attach_function 'IsMouseInPointerEnabled', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437257(v=vs.85).aspx
      # WINUSERAPI BOOL WINAPI RegisterPointerDeviceNotifications(
      #   _In_  HWND window_class,
      #   _In_  BOOL notifyRange )
      attach_function 'RegisterPointerDeviceNotifications', [:hwnd, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454912(v=vs.85).aspx
      # BOOL WINAPI SkipPointerFrameMessages( _In_  UINT32 pointerId )
      attach_function 'SkipPointerFrameMessages', [:uint32], :bool
    end
  end
end