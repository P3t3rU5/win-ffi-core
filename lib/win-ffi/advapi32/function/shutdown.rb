require 'win-ffi/advapi32'

module WinFFI
  module Advapi32

    if WindowsVersion >= :xp

      #BOOL WINAPI AbortSystemShutdown( _In_opt_  LPTSTR lpMachineName )
      encoded_function 'AbortSystemShutdown', [:buffer_in], :bool

      #BOOL WINAPI InitiateSystemShutdown(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwTimeout,
      #  _In_      BOOL bForceAppsClosed,
      #  _In_      BOOL bRebootAfterShutdown )
      encoded_function 'InitiateSystemShutdown', [:buffer_in, :buffer_in, :dword, :bool, :bool], :bool

      #BOOL WINAPI InitiateSystemShutdownEx(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwTimeout,
      #  _In_      BOOL bForceAppsClosed,
      #  _In_      BOOL bRebootAfterShutdown,
      #  _In_      DWORD dwReason )
      encoded_function 'InitiateSystemShutdownEx', [:buffer_in, :buffer_in, :dword, :bool, :bool, :dword], :bool

      #DWORD WINAPI InitiateShutdown(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwGracePeriod,
      #  _In_      DWORD dwShutdownFlags,
      #  _In_      DWORD dwReason )
      encoded_function 'InitiateShutdown', [:buffer_in, :buffer_in, :dword, :dword, :dword], :dword if WindowsVersion >= :vista
    end
  end
end