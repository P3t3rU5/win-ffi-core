require 'win-ffi/comctl32'

require 'win-ffi/comctl32/struct/init_common_controls_ex'

module WinFFI
  module Comctl32
    if WindowsVersion >= :vista
      # BOOL InitCommonControlsEx( _In_  const LPINITCOMMONCONTROLSEX lpInitCtrls)
      attach_function 'InitCommonControlsEx', [INITCOMMONCONTROLSEX.ptr], :bool

      #TODO READERMODEINFO
      # void WINAPI DoReaderMode( _In_ PREADERMODEINFO prmi);
      # attach_function 'DoReaderMode', [:pointer], :void

      # void InitCommonControls(void);
      attach_function 'InitCommonControls', [], :void
    end
  end
end