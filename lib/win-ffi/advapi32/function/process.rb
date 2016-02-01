require 'win-ffi/advapi32'

module WinFFI
  module Advapi32
    # BOOL WINAPI CreateProcessAsUser(
    #   _In_opt_     HANDLE hToken,
    #   _In_opt_     LPCTSTR lpApplicationName,
    #   _Inout_opt_  LPTSTR lpCommandLine,
    #   _In_opt_     LPSECURITY_ATTRIBUTES lpProcessAttributes,
    #   _In_opt_     LPSECURITY_ATTRIBUTES lpThreadAttributes,
    #   _In_         BOOL bInheritHandles,
    #   _In_         DWORD dwCreationFlags,
    #   _In_opt_     LPVOID lpEnvironment,
    #   _In_opt_     LPCTSTR lpCurrentDirectory,
    #   _In_         LPSTARTUPINFO lpStartupInfo,
    #   _Out_        LPPROCESS_INFORMATION lpProcessInformation )
    encoded_function 'CreateProcessAsUser', [:handle, :string, :string, :pointer, :pointer, :bool, :dword, :pointer, :string, :pointer, :pointer], :bool

    #TODO
    # BOOL WINAPI CreateProcessWithLogonW(
    #     _In_         LPCWSTR lpUsername,
    #     _In_opt_     LPCWSTR lpDomain,
    #     _In_         LPCWSTR lpPassword,
    #     _In_         DWORD dwLogonFlags,
    #     _In_opt_     LPCWSTR lpApplicationName,
    #     _Inout_opt_  LPWSTR lpCommandLine,
    #     _In_         DWORD dwCreationFlags,
    #     _In_opt_     LPVOID lpEnvironment,
    #     _In_opt_     LPCWSTR lpCurrentDirectory,
    #     _In_         LPSTARTUPINFOW lpStartupInfo,
    #     _Out_        LPPROCESS_INFORMATION lpProcessInfo )
    attach_function 'CreateProcessWithLogonW', [:string, :string, :string, :dword, :string, :pointer, :dword, :pointer, :string, :pointer, :pointer], :bool
  end
end