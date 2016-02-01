require 'win-ffi/user32'

require 'win-ffi/user32/enum/gui_resources_flags'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683192(v=vs.85).aspx
    # DWORD WINAPI GetGuiResources(
    #   _In_  HANDLE hProcess,
    #   _In_  DWORD uiFlags )
    attach_function 'GetGuiResources', [:handle, GuiResourcesFlags], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686884(v=vs.85).aspx
    # BOOL WINAPI UserHandleGrantAccess(
    #   _In_  HANDLE hUserHandle,
    #   _In_  HANDLE hJob,
    #   _In_  BOOL bGrant )
    attach_function 'UserHandleGrantAccess', [:handle, :handle, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687022(v=vs.85).aspx
    # DWORD WINAPI WaitForInputIdle(
    #   _In_  HANDLE hProcess,
    #   _In_  DWORD dwMilliseconds )
    attach_function 'WaitForInputIdle', [:handle, :dword], :dword

    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448383(v=vs.85).aspx
      # BOOL WINAPI IsImmersiveProcess( _In_  HANDLE hProcess )
      attach_function 'IsImmersiveProcess', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613327(v=vs.85).aspx
      # BOOL WINAPI SetProcessRestrictionExemption( BOOL fEnableExemption )
      attach_function 'SetProcessRestrictionExemption', [:bool], :bool
    end
  end
end