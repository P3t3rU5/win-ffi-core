module WinFFi
  module User32
    module Accessibility
      extend WinFFI::LibBase

      ffi_lib 'user32'

      #BOOL WINAPI RegisterPointerInputTarget(
      #  _In_  HWND hwnd,
      #  _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'RegisterPointerInputTarget', [:hwnd, WinFFI::User32::Pointer::POINTER_INPUT_TYPE], :bool

      #TODO
      #LRESULT CALLBACK SoundSentryProc(
      #  DWORD dwMillisec,
      #  DWORD fdwEffect )


      #BOOL WINAPI UnregisterPointerInputTarget(
      #  _In_  HWND hwnd,
      #  _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'UnregisterPointerInputTarget', [:hwnd, WinFFI::User32::Pointer::POINTER_INPUT_TYPE], :bool
    end
  end
end