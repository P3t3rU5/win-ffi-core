require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/system_parameters_info_action'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724385(v=vs.85).aspx
    # int WINAPI GetSystemMetrics( _In_  int nIndex )
    attach_function 'GetSystemMetrics', [SystemMetricsFlag], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724947(v=vs.85).aspx
    # BOOL WINAPI SystemParametersInfo(
      #   _In_     UINT uiAction,
      #   _In_     UINT uiParam,
      #   _Inout_  PVOID pvParam,
      #   _In_     UINT fWinIni )
    encoded_function 'SystemParametersInfo', [SystemParametersInfoAction, :uint, :pointer, :uint], :bool
  end
end