module WinFFI
  module User32
    module Touch
      extend LibBase

      ffi_lib 'user32'

      TouchInjectionFlags = enum :touch_injection_flags, [
          :TOUCH_FEEDBACK_DEFAULT, 0x1, # Specifies default touch visualizations.
          :TOUCH_FEEDBACK_INDIRECT, 0x2, # Specifies indirect touch visualizations.
          :TOUCH_FEEDBACK_NONE, 0x3, # Specifies no touch visualizations.
          :MAX_TOUCH_COUNT, 256, # Specifies the maximum number of simultaneous contacts.
      ]

      class TOUCH_HIT_TESTING_PROXIMITY_EVALUATION < FFI::Struct
        layout :score,         :uint16,
               :adjustedPoint, POINT
      end

      class TOUCH_HIT_TESTING_INPUT < FFI::Struct
        layout :pointerId,              :uint32,
               :point,                  POINT,
               :boundingBox,            RECT,
               :nonOccludedBoundingBox, RECT,
               :orientation,            :uint32
      end

      #BOOL WINAPI CloseTouchInputHandle( _In_  HTOUCHINPUT hTouchInput )
      attach_function 'CloseTouchInputHandle', [:pointer], :bool


      #BOOL WINAPI GetTouchInputInfo(
      #  _In_   HTOUCHINPUT hTouchInput,
      #  _In_   UINT cInputs,
      #  _Out_  PTOUCHINPUT pInputs,
      #  _In_   int cbSize )
      attach_function 'GetTouchInputInfo', [:pointer, :uint, :pointer, :int], :bool

      #BOOL WINAPI IsTouchWindow(
      #  _In_       HWND hWnd,
      #  _Out_opt_  PULONG pulFlags )
      attach_function 'IsTouchWindow', [:hwnd, :pointer], :bool

      #BOOL WINAPI RegisterTouchWindow(
      #  _In_  HWND hWnd,
      #  _In_  ULONG ulFlags )
      attach_function 'RegisterTouchWindow', [:hwnd, :ulong], :bool

      #BOOL WINAPI UnregisterTouchWindow( _In_  HWND hWnd )
      attach_function 'UnregisterTouchWindow', [:hwnd], :bool

      if WindowsVersion >= 8

        #WINUSERAPI BOOL WINAPI EvaluateProximityToPolygon(
        #  UINT32 numVertices,
        #  _In_   const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #  _Out_  TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'EvaluateProximityToPolygon', [:uint, POINT.ptr, :pointer], :bool

        #WINUSERAPI BOOL WINAPI EvaluateProximityToRect(
        #  _In_   const RECT *controlBoundingBox,
        #  _In_   const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #  _Out_  TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'EvaluateProximityToRect', [RECT.ptr, :pointer, :pointer], :bool

        #BOOL InitializeTouchInjection(
        #  _In_  UINT32 maxCount,
        #  _In_  DWORD dwMode )
        attach_function 'InitializeTouchInjection', [:uint32, TouchInjectionFlags], :bool

        #BOOL InjectTouchInput(
        #  _In_  UINT32 count,
        #  _In_  const POINTER_TOUCH_INFO *contacts )
        attach_function 'InjectTouchInput', [:uint32, :pointer], :bool

        #WINUSERAPI LRESULT WINAPI PackTouchHitTestingProximityEvaluation(
        #  _In_  const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #  _In_  const TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'PackTouchHitTestingProximityEvaluation', [TOUCH_HIT_TESTING_INPUT.ptr, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.ptr], :lresult

        #WINUSERAPI BOOL WINAPI RegisterTouchHitTestingWindow(
        #  _In_  HWND hwnd,
        #  _In_  ULONG value )
        attach_function 'RegisterTouchHitTestingWindow', [:hwnd, :ulong], :bool

      end
    end
  end
end
