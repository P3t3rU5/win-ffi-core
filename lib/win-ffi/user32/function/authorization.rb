require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa446675(v=vs.85).aspx
      # BOOL WINAPI GetUserObjectSecurity(
      #   _In_         HANDLE hObj,
      #   _In_         PSECURITY_INFORMATION pSIRequested,
      #   _Inout_opt_  PSECURITY_DESCRIPTOR pSD,
      #   _In_         DWORD nLength,
      #   _Out_        LPDWORD lpnLengthNeeded )
      attach_function 'GetUserObjectSecurity', [:handle, :pointer, :pointer, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379592(v=vs.85).aspx
      # BOOL WINAPI SetUserObjectSecurity(
      #   _In_  HANDLE hObj,
      #   _In_  PSECURITY_INFORMATION pSIRequested,
      #   _In_  PSECURITY_DESCRIPTOR pSID )
      attach_function 'SetUserObjectSecurity', [:handle, :pointer, :pointer], :bool
    end
  end
end