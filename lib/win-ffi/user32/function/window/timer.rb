require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/timer_value_coalescing'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644903(v=vs.85).aspx
    # BOOL WINAPI KillTimer(
    #   _In_opt_  HWND hWnd,
    #   _In_      UINT_PTR uIDEvent )
    attach_function 'KillTimer', [:hwnd, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644906(v=vs.85).aspx
    # UINT_PTR WINAPI SetTimer(
    #   _In_opt_  HWND hWnd,
    #   _In_      UINT_PTR nIDEvent,
    #   _In_      UINT uElapse,
    #   _In_opt_  TIMERPROC lpTimerFunc )
    attach_function 'SetTimer', [:hwnd, :ulong, :uint, :pointer], :ulong

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644907(v=vs.85).aspx
    # VOID CALLBACK TimerProc(
    #   _In_  HWND hwnd,
    #   _In_  UINT uMsg,
    #   _In_  UINT_PTR idEvent,
    #   _In_  DWORD dwTime )
    TimerProc = callback 'TimerProc', [:hwnd, :uint, :ulong, :dword], :void

    if WindowsVersion >= 7
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh405404(v=vs.85).aspx
      # UINT_PTR WINAPI SetCoalescableTimer(
      #   _In_opt_  HWND hwnd,
      #   _In_      UINT_PTR nIDEvent,
      #   _In_      UINT uElapse,
      #   _In_opt_  TIMERPROC lpTimerFunc,
      #   _In_      ULONG uToleranceDelay )
      attach_function 'SetCoalescableTimer', [:hwnd, :ulong, :uint, :pointer, TimerValueCoalescing], :ulong
    end
  end
end