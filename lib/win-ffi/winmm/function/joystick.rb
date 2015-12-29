require 'win-ffi/winmm'

require 'win-ffi/winmm/enum/mm_result'

require 'win-ffi/winmm/struct/joycaps'
require 'win-ffi/winmm/struct/joyinfo'
require 'win-ffi/winmm/struct/joyinfoex'

module WinFFI
  module Winmm

    # MMRESULT joyConfigChanged( DWORD dwFlags )
    attach_function 'joyConfigChanged', [:dword], MMRESULT

    # MMRESULT joyGetDevCaps(
    #    UINT_PTR uJoyID,
    #    LPJOYCAPS pjc,
    #    UINT cbjc);
    encoded_function 'joyGetDevCaps', [:pointer, JOYCAPS.ptr, :uint], MMRESULT

    # UINT joyGetNumDevs(void);
    attach_function 'joyGetNumDevs', [], :uint

    # MMRESULT joyGetPos(
    #   UINT uJoyID,
    #   LPJOYINFO pji);
    attach_function 'joyGetPos', [:uint, JOYINFO.ptr], MMRESULT

    # MMRESULT joyGetPosEx(
    #   UINT uJoyID,
    #   LPJOYINFOEX pji);
    attach_function 'joyGetPosEx', [:uint, JOYINFOEX.ptr], MMRESULT

    # MMRESULT joyGetThreshold(
    #   UINT uJoyID,
    #   LPUINT puThreshold);
    attach_function 'joyGetThreshold', [:uint, :pointer], MMRESULT

    # MMRESULT joyReleaseCapture( UINT uJoyID );
    attach_function 'joyReleaseCapture', [:uint], MMRESULT

    # MMRESULT joySetCapture(
    #   HWND hwnd,
    #   UINT uJoyID,
    #   UINT uPeriod,
    #   BOOL fChanged);
    attach_function 'joySetCapture', [:hwnd, :uint, :uint, :bool], MMRESULT

    # MMRESULT joySetThreshold(
    #   UINT uJoyID,
    #   UINT uThreshold);
    attach_function 'joySetThreshold', [:uint, :uint], MMRESULT

  end
end