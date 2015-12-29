require 'win-ffi/user32'

module WinFFI
  module User32
    #DWORD WINAPI GetGuiResources(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD uiFlags )
    attach_function 'GetGuiResources', [:handle, GuiResourcesFlags], :dword

    if WindowsVersion >= 8
      #BOOL WINAPI IsImmersiveProcess( _In_  HANDLE hProcess )
      attach_function 'IsImmersiveProcess', [:handle], :bool

      #Windows Store Apps
      #BOOL WINAPI SetProcessRestrictionExemption( BOOL fEnableExemption )
      attach_function 'SetProcessRestrictionExemption', [:bool], :bool
    end

    #BOOL WINAPI UserHandleGrantAccess(
    #  _In_  HANDLE hUserHandle,
    #  _In_  HANDLE hJob,
    #  _In_  BOOL bGrant )
    attach_function 'UserHandleGrantAccess', [:handle, :handle, :bool], :bool

    #DWORD WINAPI WaitForInputIdle(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD dwMilliseconds )
    attach_function 'WaitForInputIdle', [:handle, :dword], :dword
  end
end