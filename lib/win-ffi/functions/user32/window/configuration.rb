require 'win-ffi/functions/user32'

require_relative '../../../enums/user32/window/system_parameters_info_action'

module WinFFI
  module User32
      #BOOL WINAPI SystemParametersInfo(
      #  _In_     UINT uiAction,
      #  _In_     UINT uiParam,
      #  _Inout_  PVOID pvParam,
      #  _In_     UINT fWinIni )
      attach_function 'SystemParametersInfoA', [SystemParametersInfoAction, :uint, :pointer, :uint], :bool
      attach_function 'SystemParametersInfoW', [SystemParametersInfoAction, :uint, :pointer, :uint], :bool
  end
end