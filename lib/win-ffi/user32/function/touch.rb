require 'win-ffi/user32'

require 'win-ffi/user32/enum/interaction/touch_injection_flags'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/interaction/touch_hit_testing_input'
require 'win-ffi/user32/struct/interaction/touch_hit_testing_proximity_evaluation'

module WinFFI
  module User32
    if WindowsVersion >= 7
      # BOOL WINAPI CloseTouchInputHandle( _In_  HTOUCHINPUT hTouchInput ) # input event handle; from touch message lParam
      attach_function 'CloseTouchInputHandle', [:pointer], :bool

      # BOOL WINAPI GetTouchInputInfo(
      #   _In_   HTOUCHINPUT hTouchInput, # input event handle; from touch message lParam
      #   _In_   UINT cInputs,            # number of elements in the array
      #   _Out_  PTOUCHINPUT pInputs,     # array of touch inputs
      #   _In_   int cbSize )             # sizeof(TOUCHINPUT)
      attach_function 'GetTouchInputInfo', [:pointer, :uint, :pointer, :int], :bool

      # BOOL WINAPI IsTouchWindow(
      #   _In_       HWND hWnd,
      #   _Out_opt_  PULONG pulFlags )
      attach_function 'IsTouchWindow', [:hwnd, TouchWindowFlags], :bool

      # BOOL WINAPI RegisterTouchWindow(
      #   _In_  HWND hWnd,
      #   _In_  ULONG ulFlags )
      attach_function 'RegisterTouchWindow', [:hwnd, TouchWindowFlags], :bool

      # BOOL WINAPI UnregisterTouchWindow( _In_  HWND hWnd )
      attach_function 'UnregisterTouchWindow', [:hwnd], :bool

      if WindowsVersion >= 8
        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437245(v=vs.85).aspx
        # WINUSERAPI BOOL WINAPI EvaluateProximityToPolygon(
        #   UINT32 numVertices,
        #   _In_reads_(numVertices) const POINT *controlPolygon,
        #   _In_   const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #   _Out_  TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'EvaluateProximityToPolygon',
                        [:uint, POINT.ptr,
                         TOUCH_HIT_TESTING_INPUT.ptr, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437246(v=vs.85).aspx
        # WINUSERAPI BOOL WINAPI EvaluateProximityToRect(
        #   _In_   const RECT *controlBoundingBox,
        #   _In_   const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #   _Out_  TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'EvaluateProximityToRect',
                        [RECT.ptr, TOUCH_HIT_TESTING_INPUT.ptr, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802880(v=vs.85).aspx
        # BOOL InitializeTouchInjection(
        #   _In_  UINT32 maxCount,
        #   _In_  DWORD dwMode )
        attach_function 'InitializeTouchInjection', [:uint32, TouchInjectionFlags], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802881(v=vs.85).aspx
        # BOOL InjectTouchInput(
        #   _In_  UINT32 count,
        #   _In_  const POINTER_TOUCH_INFO *contacts )
        attach_function 'InjectTouchInput', [:uint32, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437250(v=vs.85).aspx
        # WINUSERAPI LRESULT WINAPI PackTouchHitTestingProximityEvaluation(
        #   _In_  const TOUCH_HIT_TESTING_INPUT *pHitTestingInput,
        #   _In_  const TOUCH_HIT_TESTING_PROXIMITY_EVALUATION *pProximityEval )
        attach_function 'PackTouchHitTestingProximityEvaluation', [TOUCH_HIT_TESTING_INPUT.ptr, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.ptr], :lresult

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437252(v=vs.85).aspx
        # WINUSERAPI BOOL WINAPI RegisterTouchHitTestingWindow(
        #   _In_  HWND hwnd,
        #   _In_  ULONG value )
        attach_function 'RegisterTouchHitTestingWindow', [:hwnd, :ulong], :bool
      end
    end
  end
end
