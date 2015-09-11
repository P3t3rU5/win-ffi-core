require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/touch_injection_flags'

require 'win-ffi/structs/rect'
require 'win-ffi/structs/user32/touch_hit_testing_input'
require 'win-ffi/structs/user32/touch_hit_testing_proximity_evaluation'

module WinFFI
  module User32
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
