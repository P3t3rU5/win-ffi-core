require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373647(v=vs.85).aspx
    # LRESULT CALLBACK SoundSentryProc(
    #   DWORD dwMillisec,
    #   DWORD fdwEffect )
    SoundSentryProc = callback :SoundSentryProc, [:dword, :dword], :lresult

    if WindowsVersion >= 8

      require 'win-ffi/user32/enum/interaction/pointer/pointer_input_type'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454911(v=vs.85).aspx
      # BOOL WINAPI RegisterPointerInputTarget(
      #   _In_  HWND hwnd,
      #   _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'RegisterPointerInputTarget', [:hwnd, POINTER_INPUT_TYPE], :bool

      # BOOL WINAPI UnregisterPointerInputTarget(
      #   _In_  HWND hwnd,
      #   _In_  POINTER_INPUT_TYPE  pointerType )
      attach_function 'UnregisterPointerInputTarget', [:hwnd, POINTER_INPUT_TYPE], :bool

      if WindowsVersion >= 10
        # https://msdn.microsoft.com/en-us/library/windows/desktop/mt608589(v=vs.85).aspx
        # RegisterPointerInputTargetEx is not supported and may be altered or unavailable in the future. Instead,
        # use RegisterPointerInputTarget.
        # BOOL WINAPI RegisterPointerInputTargetEx(
        #   _In_ HWND               hwnd,
        #   _In_ POINTER_INPUT_TYPE pointerType,
        #   _In_ BOOL               fObserve)
        attach_function 'RegisterPointerInputTargetEx', [:hwnd, POINTER_INPUT_TYPE, :bool], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/mt608593(v=vs.85).aspx
        # UnregisterPointerInputTargetEx is not supported and may be altered or unavailable in the future. Instead, use
        # UnregisterPointerInputTarget.
        # BOOL WINAPI UnregisterPointerInputTargetEx(
        #   _In_ HWND               hwnd,
        #   _In_ POINTER_INPUT_TYPE pointerType)
        attach_function 'UnregisterPointerInputTargetEx', [:hwnd, POINTER_INPUT_TYPE], :bool
      end
    end
  end
end