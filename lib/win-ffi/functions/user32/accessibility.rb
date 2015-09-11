require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/pointer_input_type'

module WinFFI
  module User32
    #BOOL WINAPI RegisterPointerInputTarget(
    #  _In_  HWND hwnd,
    #  _In_  POINTER_INPUT_TYPE  pointerType )
    attach_function 'RegisterPointerInputTarget', [:hwnd, PointerInputType], :bool

    #TODO
    #LRESULT CALLBACK SoundSentryProc(
    #  DWORD dwMillisec,
    #  DWORD fdwEffect )


    #BOOL WINAPI UnregisterPointerInputTarget(
    #  _In_  HWND hwnd,
    #  _In_  POINTER_INPUT_TYPE  pointerType )
    attach_function 'UnregisterPointerInputTarget', [:hwnd, PointerInputType], :bool
  end
end