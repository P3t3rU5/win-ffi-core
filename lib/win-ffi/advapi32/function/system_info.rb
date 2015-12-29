require 'win-ffi/advapi32'

module WinFFI
  module Advapi32

    #BOOL WINAPI GetCurrentHwProfile( _Out_  LPHW_PROFILE_INFO lpHwProfileInfo )
    encoded_function 'GetCurrentHwProfile', [:pointer], :bool

    #BOOL WINAPI GetUserName(
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    encoded_function 'GetUserName', [:pointer, :pointer], :bool
  end
end