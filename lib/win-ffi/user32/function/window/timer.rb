require 'win-ffi/user32'

module WinFFI
  module User32
    #BOOL WINAPI KillTimer(
    #  _In_opt_  HWND hWnd,
    #  _In_      UINT_PTR uIDEvent )
    attach_function 'KillTimer', [:hwnd, :uint], :bool

    if WindowsVersion >= 8

      #UINT_PTR WINAPI SetCoalescableTimer(
      #  _In_opt_  HWND hwnd,
      #  _In_      UINT_PTR nIDEvent,
      #  _In_      UINT uElapse,
      #  _In_opt_  TIMERPROC lpTimerFunc,
      #  _In_      ULONG uToleranceDelay )
      attach_function 'SetCoalescableTimer', [:hwnd, :ulong, :uint, :pointer, :ulong], :ulong

    end

    #UINT_PTR WINAPI SetTimer(
    #  _In_opt_  HWND hWnd,
    #  _In_      UINT_PTR nIDEvent,
    #  _In_      UINT uElapse,
    #  _In_opt_  TIMERPROC lpTimerFunc )
    attach_function 'SetTimer', [:hwnd, :ulong, :uint, :pointer], :ulong

    #VOID CALLBACK TimerProc(
    #  _In_  HWND hwnd,
    #  _In_  UINT uMsg,
    #  _In_  UINT_PTR idEvent,
    #  _In_  DWORD dwTime )
    TimerProc = callback :TimerProc, [:hwnd, :uint, :ulong, :dword], :void
  end
end