module WinFFI
  module User32
    module KeyboardAccelerators
      extend LibBase

      ffi_lib 'user32'

      #int WINAPI CopyAcceleratorTable(
      #  _In_       HACCEL hAccelSrc,
      #  _Out_opt_  LPACCEL lpAccelDst,
      #  _In_       int cAccelEntries )
      attach_function 'CopyAcceleratorTableA', [:haccel, :pointer, :int], :int
      attach_function 'CopyAcceleratorTableW', [:haccel, :pointer, :int], :int

      #HACCEL WINAPI CreateAcceleratorTable(
      #  _In_  LPACCEL lpaccl,
      #  _In_  int cEntries )
      attach_function 'CreateAcceleratorTableA', [:haccel, :int], :pointer
      attach_function 'CreateAcceleratorTableW', [:haccel, :int], :pointer

      #BOOL WINAPI DestroyAcceleratorTable( _In_  HACCEL hAccel )
      attach_function 'DestroyAcceleratorTable', [:haccel], :bool

      #HACCEL WINAPI LoadAccelerators(
      #  _In_opt_  HINSTANCE hInstance,
      #  _In_      LPCTSTR lpTableName )
      attach_function 'LoadAcceleratorsA', [:hinstance, :string], :haccel
      attach_function 'LoadAcceleratorsW', [:hinstance, :string], :haccel

      #int WINAPI TranslateAccelerator(
      #  _In_  HWND hWnd,
      #  _In_  HACCEL hAccTable,
      #  _In_  LPMSG lpMsg )
      attach_function 'TranslateAccelerator', [:hwnd, :haccel, MSG.ptr], :int
      attach_function 'TranslateAcceleratorA', [:hwnd, :haccel, MSG.ptr], :int
      attach_function 'TranslateAcceleratorW', [:hwnd, :haccel, MSG.ptr], :int

    end
  end
end