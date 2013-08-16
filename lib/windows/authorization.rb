module WinFFI
  module Authorization
    extend LibBase

    ffi_lib 'user32'

    #BOOL WINAPI GetUserObjectSecurity(
    #  _In_         HANDLE hObj,
    #  _In_         PSECURITY_INFORMATION pSIRequested,
    #  _Inout_opt_  PSECURITY_DESCRIPTOR pSD,
    #  _In_         DWORD nLength,
    #  _Out_        LPDWORD lpnLengthNeeded )
    attach_function 'GetUserObjectSecurity', [:handle, :pointer, :pointer, :dword, :pointer], :bool

    #BOOL WINAPI SetUserObjectSecurity(
    #  _In_  HANDLE hObj,
    #  _In_  PSECURITY_INFORMATION pSIRequested,
    #  _In_  PSECURITY_DESCRIPTOR pSID )
    attach_function 'SetUserObjectSecurity', [:handle, :pointer, :pointer], :bool

  end
end