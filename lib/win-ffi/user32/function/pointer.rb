require 'win-ffi/user32'

require 'win-ffi/user32/enum/pointer_input_type'

require 'win-ffi/user32/struct/pointer_info'
require 'win-ffi/user32/struct/pointer_pen_info'
require 'win-ffi/user32/struct/pointer_touch_info'

module WinFFI
  module User32
    if WindowsVersion >= 8
      #BOOL WINAPI EnableMouseInPointer( _In_  BOOL fEnable )
      attach_function 'EnableMouseInPointer', [:bool], :bool

      #BOOL WINAPI GetPointerCursorId (
      #  _In_   UINT32 pointerId,
      #  _Out_  UINT32 *cursorId )
      attach_function 'GetPointerCursorId', [:uint32, :uint32], :bool

      #WINUSERAPI BOOL WINAPI WINAPI GetPointerDevice(
      #  _In_   HANDLE device,
      #  _Out_  POINTER_DEVICE_INFO *pointerDevice )
      attach_function 'GetPointerDevice', [:handle, :pointer], :bool

      #BOOL GetPointerDeviceCursors(
      # _In_       HANDLE device,
      # _Inout_    UINT32 *cursorCount,
      # _Out_opt_  POINTER_DEVICE_CURSOR_INFO *deviceCursors )
      attach_function 'GetPointerDeviceCursors', [:handle, :pointer, :pointer], :bool

      #BOOL GetPointerDeviceProperties(
      #  _In_       HANDLE device,
      #  _Inout_    UINT32 *propertyCount,
      #  _Out_opt_  POINTER_DEVICE_PROPERTY *pointerProperties )
      attach_function 'GetPointerDeviceProperties', [:handle, :pointer, :pointer], :bool

      #BOOL GetPointerDeviceRects(
      #  _In_   HANDLE device,
      #  _Out_  RECT *pointerDeviceRect,
      #  _Out_  RECT *displayRect )
      attach_function 'GetPointerDeviceRects', [:handle, RECT.ptr, RECT.ptr], :bool

      #WINUSERAPI BOOL WINAPI WINAPI GetPointerDevices(
      #  _Inout_    UINT32 deviceCount,
      #  _Out_opt_  POINTER_DEVICE_INFO *pointerDevices )
      attach_function 'GetPointerDevices', [:uint32, :pointer], :bool

      #BOOL WINAPI GetPointerFrameInfo(
      #  _In_     UINT32 pointerId,
      #  _Inout_  UINT32 *pointerCount,
      #  _Out_    POINTER_INFO *pointerInfo )
      attach_function 'GetPointerFrameInfo', [:uint32, :pointer, POINTER_INFO.ptr], :bool

      #BOOL WINAPI GetPointerFrameInfoHistory(
      #  _In_     UINT32 pointerId,
      #  _Inout_  UINT32 *entriesCount,
      #  _Inout_  UINT32 *pointerCount,
      #  _Out_    POINTER_INFO * pointerInfo )
      attach_function 'GetPointerFrameInfoHistory', [:uint32, :pointer, :pointer, POINTER_INFO.ptr], :bool

      #BOOL WINAPI GetPointerFramePenInfo(
      #  _In_     UINT32 pointerId,
      #  _Inout_  UINT32 *pointerCount,
      #  _Out_    POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerFramePenInfo', [:uint32, :pointer, POINTER_PEN_INFO.ptr], :bool

      #BOOL WINAPI GetPointerFramePenInfoHistory(
      #  _In_       UINT32 pointerId,
      #  _Inout_    UINT32 *entriesCount,
      #  _Inout_    UINT32 *pointerCount,
      #  _Out_opt_  POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerFramePenInfoHistory', [:uint32, :pointer, :pointer, POINTER_PEN_INFO.ptr], :bool

      #BOOL WINAPI GetPointerFrameTouchInfo(
      #  _In_     UINT32 pointerId,
      #  _Inout_  UINT32 *pointerCount,
      #  _Out_    POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerFrameTouchInfo', [:uint32, :pointer, POINTER_TOUCH_INFO.ptr], :bool

      #BOOL WINAPI GetPointerFrameTouchInfoHistory(
      #  _In_     UINT32 pointerId,
      #  _Inout_  UINT32 *entriesCount,
      #  _Inout_  UINT32 *pointerCount,
      #  _Out_    POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerFrameTouchInfoHistory', [:uint32, :pointer, :pointer, POINTER_TOUCH_INFO.ptr], :bool

      #BOOL WINAPI GetPointerInfo(
      #  _In_   UINT32 pointerId,
      #  _Out_  POINTER_INFO *pointerInfo )
      attach_function 'GetPointerInfo', [:uint32, POINTER_INFO.ptr], :bool

      #BOOL WINAPI GetPointerInfoHistory(
      #  _In_       UINT32 pointerId,
      #  _Inout_    UINT32 *entriesCount,
      #  _Out_opt_  POINTER_INFO *pointerInfo )
      attach_function 'GetPointerInfoHistory', [:uint32, :pointer, POINTER_INFO.ptr], :bool

      if WindowsVersion >= 8.1
        #BOOL WINAPI GetPointerInputTransform(
        #  _In_   UINT32 pointerId,
        #  _In_   UINT32 historyCount,
        #  _Out_  UINT32 *inputTransform )
        attach_function 'GetPointerInputTransform', [:uint, :uint, :pointer], :bool
      end

      #BOOL WINAPI GetPointerPenInfo(
      #  _In_   UINT32 pointerId,
      #  _Out_  POINTER_PEN_INFO *penInfo )
      attach_function 'GetPointerPenInfo', [:uint32, POINTER_PEN_INFO.ptr], :bool

      #BOOL WINAPI GetPointerPenInfoHistory(
      #  _In_       UINT32 pointerId,
      #  _Inout_    UINT32 *entriesCount,
      #  _Out_opt_  POINTER_PEN_INFO  *penInfo )
      attach_function 'GetPointerPenInfoHistory', [:uint32, :pointer, POINTER_PEN_INFO.ptr], :bool

      #BOOL WINAPI GetPointerTouchInfo(
      #  _In_   UINT32 pointerId,
      #  _Out_  POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerTouchInfo', [:uint32, POINTER_TOUCH_INFO.ptr], :bool

      #BOOL WINAPI GetPointerTouchInfoHistory(
      #  _In_       UINT32 pointerId,
      #  _Inout_    UINT32 *entriesCount,
      #  _Out_opt_  POINTER_TOUCH_INFO *touchInfo )
      attach_function 'GetPointerTouchInfoHistory', [:uint32, :pointer, POINTER_TOUCH_INFO.ptr], :bool

      #BOOL WINAPI GetPointerType (
      #  _In_   UINT32 pointerId,
      #  _Out_  POINTER_INPUT_TYPE *pointerType )
      attach_function 'GetPointerType', [:uint32, PointerInputType], :bool

      #BOOL GetRawPointerDeviceData(
      #  _In_   UINT32 pointerId,
      #  _In_   UINT32 historyCount,
      #  _In_   UINT32 propertiesCount,
      #  _In_   POINTER_DEVICE_PROPERTY *pProperties,
      #  _Out_  LONG *pValues )
      attach_function 'GetRawPointerDeviceData', [:uint32, :uint32, :uint32, :pointer, :pointer], :bool

      #DWORD WINAPI GetUnpredictedMessagePos(void)
      attach_function 'GetUnpredictedMessagePos', [], :dword

      #BOOL WINAPI IsMousePointerEnabled(void)
      #attach_function 'IsMousePointerEnabled', [], :bool

      #WINUSERAPI BOOL WINAPI RegisterPointerDeviceNotifications(
      #  _In_  HWND window,
      #  _In_  BOOL notifyRange )
      attach_function 'RegisterPointerDeviceNotifications', [:hwnd, :bool], :bool

      #BOOL WINAPI SkipPointerFrameMessages( _In_  UINT32 pointerId )
      attach_function 'SkipPointerFrameMessages', [:uint32], :bool
    end
  end
end