require 'win-ffi/user32'

require 'win-ffi/user32/struct/window/message/msg'

module WinFFI
  module User32

    typedef :pointer, :haccel

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646364(v=vs.85).aspx
    #int WINAPI CopyAcceleratorTable(
    #  _In_       HACCEL hAccelSrc,
    #  _Out_opt_  LPACCEL lpAccelDst,
    #  _In_       int cAccelEntries )
    encoded_function 'CopyAcceleratorTable', [:haccel, :pointer, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646365(v=vs.85).aspx
    # HACCEL WINAPI CreateAcceleratorTable(
    #   _In_  LPACCEL lpaccl,
    #   _In_  int cEntries )
    encoded_function 'CreateAcceleratorTable', [:pointer, :int], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646368(v=vs.85).aspx
    # BOOL WINAPI DestroyAcceleratorTable( _In_  HACCEL hAccel )
    attach_function 'DestroyAcceleratorTable', [:haccel], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646370(v=vs.85).aspx
    # HACCEL WINAPI LoadAccelerators(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCTSTR lpTableName )
    encoded_function 'LoadAccelerators', [:hinstance, :string], :haccel

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646370(v=vs.85).aspx
    # int WINAPI TranslateAccelerator(
    #   _In_  HWND hWnd,
    #   _In_  HACCEL hAccTable,
    #   _In_  LPMSG lpMsg )
    encoded_function 'TranslateAccelerator', [:hwnd, :haccel, MSG.ptr], :int
  end
end