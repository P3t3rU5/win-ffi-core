module WinFFI
  module User32
    module Pointer
      extend LibBase
      ffi_lib 'user32'

      PenFlags = enum :pen_flags, [
          :PEN_FLAG_BARREL,   0x00000001, # The barrel button is pressed.
          :PEN_FLAG_INVERTED, 0x00000002, # The pen is inverted.
          :PEN_FLAG_ERASER,   0x00000004, # The eraser button is pressed.
      ]

      PenMask = enum :pen_mask, [
          :PEN_MASK_NONE,     0x00000000, # Default. None of the optional fields are valid.
          :PEN_MASK_PRESSURE, 0x00000001, # pressure of the POINTER_PEN_INFO structure is valid.
          :PEN_MASK_ROTATION, 0x00000002, # rotation of the POINTER_PEN_INFO structure is valid.
          :PEN_MASK_TILT_X,   0x00000004, # tiltX of the POINTER_PEN_INFO structure is valid.
          :PEN_MASK_TILT_Y,   0x00000008, # tiltY of the POINTER_PEN_INFO structure is valid.
      ]

      PointerFlags = enum :pointer_flags, [
          :NONE,    0x00000000, # Default

          :NEW,     0x00000001, # Indicates the arrival of a new pointer.

          :INRANGE, 0x00000002, # Indicates that this pointer continues to exist. When this flag is not set,
          # it indicates the pointer has left detection range. This flag is typically not set only when a hovering pointer
          # leaves detection range (POINTER_FLAG_UPDATE is set) or when a pointer in contact with a window surface leaves
          # detection range (POINTER_FLAG_UP is set).

          :INCONTACT, 0x00000004, #Indicates that this pointer is in contact with the digitizer surface.
          # When this flag is not set, it indicates a hovering pointer.

          :FIRSTBUTTON, 0x00000010, # Indicates a primary action, analogous to a left mouse button down.
          #A touch pointer has this flag set when it is in contact with the digitizer surface.
          #A pen pointer has this flag set when it is in contact with the digitizer surface with no buttons pressed.
          #A mouse pointer has this flag set when the left mouse button is down.

          :SECONDBUTTON, 0x00000020, # Indicates a secondary action, analogous to a right mouse button down.
          #A touch pointer does not use this flag. A pen pointer has this flag set when it is in contact with the
          # digitizer surface with the pen barrel button pressed.A mouse pointer has this flag set when the right mouse
          # button is down.

          :THIRDBUTTON, 0x00000040, # Analogous to a mouse wheel button down. A touch pointer does not use
          # this flag. A pen pointer does not use this flag. A mouse pointer has this flag set when the mouse wheel button
          # is down.

          :FOURTHBUTTON, 0x00000080, # Analogous to a first extended mouse (XButton1) button down.
          # A touch pointer does not use this flag.
          # A pen pointer does not use this flag.
          # A mouse pointer has this flag set when the first extended mouse (XBUTTON1) button is down.

          :FIFTHBUTTON, 0x00000100, # Analogous to a second extended mouse (XButton2) button down.
          # A touch pointer does not use this flag.
          # A pen pointer does not use this flag.
          # A mouse pointer has this flag set when the second extended mouse (XBUTTON2) button is down.

          :PRIMARY, 0x00002000, # Indicates that this pointer has been designated as the primary pointer.
          # A primary pointer is a single pointer that can perform actions beyond those available to non-primary pointers.
          # For example, when a primary pointer makes contact with a window’s surface, it may provide the window an
          # opportunity to activate by sending it a WM_POINTERACTIVATE message. The primary pointer is identified from all
          # current user interactions on the system (mouse, touch, pen, and so on). As such, the primary pointer might not
          # be associated with your app. The first contact in a multi-touch interaction is set as the primary pointer.
          # Once a primary pointer is identified, all contacts must be lifted before a new contact can be identified as a
          # primary pointer. For apps that don't process pointer input, only the primary pointer's events are promoted to
          # mouse events.

          :CONFIDENCE, 0x000004000, # Confidence is a suggestion from the source device about whether the
          # pointer represents an intended or accidental interaction, which is especially relevant for PT_TOUCH pointers
          # where an accidental interaction (such as with the palm of the hand) can trigger input. The presence of this
          # flag indicates that the source device has high confidence that this input is part of an intended interaction.

          :POINTER_FLAG_CANCELED, 0x000008000, #Indicates that the pointer is departing in an abnormal manner, such as
          # when the system receives invalid input for the pointer or when a device with active pointers departs abruptly.
          # If the application receiving the input is in a position to do so, it should treat the interaction as not
          # completed and reverse any effects of the concerned pointer.

          :POINTER_FLAG_DOWN, 0x00010000, # Indicates that this pointer transitioned to a down state; that is, it made
          # contact with the digitizer surface.

          :POINTER_FLAG_UPDATE, 0x00020000, # Indicates that this is a simple update that does not include pointer state
          # changes.

          :POINTER_FLAG_UP, 0x00040000, # Indicates that this pointer transitioned to an up state; that is, it broke
          # contact with the digitizer surface.

          :POINTER_FLAG_WHEEL, 0x00080000, # Indicates input associated with a pointer wheel. For mouse pointers, this is
          # equivalent to the action of the mouse scroll wheel (WM_MOUSEWHEEL).

          :POINTER_FLAG_HWHEEL, 0x00100000, # Indicates input associated with a pointer h-wheel. For mouse pointers, this
          # is equivalent to the action of the mouse horizontal scroll wheel (WM_MOUSEHWHEEL).

          :POINTER_FLAG_CAPTURECHANGED, 0x00200000, # Indicates that this pointer was captured by (associated with)
                                                    # another element and the original element has lost capture (see WM_POINTERCAPTURECHANGED)
      ]

      POINTER_INPUT_TYPE = enum :pointer_input_type, [
          :PT_POINTER, 0x00000001,
          :PT_TOUCH,   0x00000002,
          :PT_PEN,     0x00000003,
          :PT_MOUSE,   0x00000004
      ]

      TouchMask = enum :touch_mask, [
          :TOUCH_MASK_NONE,        0x00000000, #Default. None of the optional fields are valid.
          :TOUCH_MASK_CONTACTAREA, 0x00000001, #rcContact of the POINTER_TOUCH_INFO structure is valid.
          :TOUCH_MASK_ORIENTATION, 0x00000002, #orientation of the POINTER_TOUCH_INFO structure is valid.
          :TOUCH_MASK_PRESSURE,    0x00000004, #pressure of the POINTER_TOUCH_INFO structure is valid.
      ]

      class POINTER_INFO < FFI::Struct
        layout :pointerType,           POINTER_INPUT_TYPE,
               :pointerId,             :uint32,
               :frameId,               :uint32,
               :pointerFlags,          PointerFlags,
               :sourceDevice,          :handle,
               :hwndTarget,            :hwnd,
               :ptPixelLocation,       POINT,
               :ptHimetricLocation,    POINT,
               :ptPixelLocationRaw,    POINT,
               :ptHimetricLocationRaw, POINT,
               :dwTime,                :dword,
               :historyCount,          :uint32,
               :inputData,             :int32,
               :dwKeyStates,           :dword,
               :PerformanceCount,      :uint,
               :ButtonChangeType,      :pointer
      end

      class POINTER_PEN_INFO < FFI::Struct
        layout :pointerInfo, POINTER_INFO,
               :penFlags,    PenFlags,
               :penMask,     PenMask,
               :pressure,    :uint32,
               :rotation,    :uint32,
               :tiltX,       :int32,
               :tiltY,       :int32
      end

      class POINTER_TOUCH_INFO < FFI::Struct
        layout :pointerInfo,  POINTER_INFO,
               :touchFlags,   :int,
               :touchMask,    TouchMask,
               :rcContact,    RECT,
               :rcContactRaw, RECT,
               :orientation,  :uint32,
               :pressure,     :uint32
      end

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

      begin
        #BOOL WINAPI GetPointerInputTransform(
        #  _In_   UINT32 pointerId,
        #  _In_   UINT32 historyCount,
        #  _Out_  UINT32 *inputTransform )
        attach_function 'GetPointerInputTransform', [:uint, :uint, :pointer], :bool
      rescue FFI::NotFoundError
        # windows 8.1 or later
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
      attach_function 'GetPointerType', [:uint32, POINTER_INPUT_TYPE], :bool

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