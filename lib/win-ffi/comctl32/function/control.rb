require 'win-ffi/comctl32'

require 'win-ffi/comctl32/struct/init_common_controls_ex'

module WinFFI
  module Comctl32
    if WindowsVersion >= :vista
      # BOOL InitCommonControlsEx( _In_  const LPINITCOMMONCONTROLSEX lpInitCtrls)
      attach_function 'InitCommonControlsEx', [INITCOMMONCONTROLSEX.ptr], :bool
    else
      # void InitCommonControls(void);
      attach_function 'InitCommonControlsEx', [], :void
    end
  end
end