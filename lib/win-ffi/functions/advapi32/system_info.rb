module WinFFI
  module Advapi32
    extend LibBase

    ffi_lib 'advapi32'

    #BOOL WINAPI GetCurrentHwProfile( _Out_  LPHW_PROFILE_INFO lpHwProfileInfo )
    attach_function 'GetCurrentHwProfileA', [:pointer], :bool
    attach_function 'GetCurrentHwProfileW', [:pointer], :bool

    #BOOL WINAPI GetUserName(
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    attach_function 'GetUserNameA', [:pointer, :pointer], :bool
    attach_function 'GetUserNameW', [:pointer, :pointer], :bool
  end
end