require_relative '../../enums/comctl32/init_common_controls'

module WinFFI
  module Comctl32
    class INITCOMMONCONTROLSEX < FFIStruct
      layout :dwsize, :dword,
             :dwICC,  InitCommonControls
    end
  end
end