require 'win-ffi/user32'

require 'win-ffi/user32/enum/pointer_input_type'

module WinFFI
  module User32
    if WindowsVersion >= 8
      #BOOL WINAPI RegisterPointerInputTarget(
      #  _In_  HWND hwnd,
      #  _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'RegisterPointerInputTarget', [:hwnd, PointerInputType], :bool

      #LRESULT CALLBACK SoundSentryProc(
      #  DWORD dwMillisec,
      #  DWORD fdwEffect )
      SoundSentryProc = callback :SoundSentryProc, [:dword, :dword], :lresult

      #BOOL WINAPI UnregisterPointerInputTarget(
      #  _In_  HWND hwnd,
      #  _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'UnregisterPointerInputTarget', [:hwnd, PointerInputType], :bool
    end
  end
end