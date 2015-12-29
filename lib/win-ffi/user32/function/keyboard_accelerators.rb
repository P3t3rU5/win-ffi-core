require 'win-ffi/user32'

require 'win-ffi/user32/struct/msg'

module WinFFI
  module User32

    typedef :pointer, :haccel

    #int WINAPI CopyAcceleratorTable(
    #  _In_       HACCEL hAccelSrc,
    #  _Out_opt_  LPACCEL lpAccelDst,
    #  _In_       int cAccelEntries )
    encoded_function 'CopyAcceleratorTable', [:haccel, :pointer, :int], :int

    #HACCEL WINAPI CreateAcceleratorTable(
    #  _In_  LPACCEL lpaccl,
    #  _In_  int cEntries )
    encoded_function 'CreateAcceleratorTable', [:haccel, :int], :pointer

    #BOOL WINAPI DestroyAcceleratorTable( _In_  HACCEL hAccel )
    attach_function 'DestroyAcceleratorTable', [:haccel], :bool

    #HACCEL WINAPI LoadAccelerators(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpTableName )
    encoded_function 'LoadAccelerators', [:hinstance, :string], :haccel

    #int WINAPI TranslateAccelerator(
    #  _In_  HWND hWnd,
    #  _In_  HACCEL hAccTable,
    #  _In_  LPMSG lpMsg )
    encoded_function 'TranslateAccelerator', [:hwnd, :haccel, MSG.ptr], :int
  end
end