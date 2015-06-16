require_relative '../../structs/comctl32/init_common_controls_ex'

module WinFFI
  module Comctl32
    if WindowsVersion >= :vista
      # BOOL InitCommonControlsEx( _In_  const LPINITCOMMONCONTROLSEX lpInitCtrls)
      attach_function 'InitCommonControlsEx', [INITCOMMONCONTROLSEX.ptr], :bool
    end
  end
end