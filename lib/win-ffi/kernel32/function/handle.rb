require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    #BOOL WINAPI CloseHandle( _In_  HANDLE hObject )
    attach_function 'CloseHandle', [:handle], :bool

    #BOOL WINAPI DuplicateHandle(
    #  _In_   HANDLE hSourceProcessHandle,
    #  _In_   HANDLE hSourceHandle,
    #  _In_   HANDLE hTargetProcessHandle,
    #  _Out_  LPHANDLE lpTargetHandle,
    #  _In_   DWORD dwDesiredAccess,
    #  _In_   BOOL bInheritHandle,
    #  _In_   DWORD dwOptions )
    attach_function 'DuplicateHandle', [:handle, :handle, :handle, :pointer, :dword, :bool, :dword], :bool

    #BOOL WINAPI GetHandleInformation(
    #  _In_   HANDLE hObject,
    #  _Out_  LPDWORD lpdwFlags )
    attach_function 'GetHandleInformation', [:handle, :pointer], :bool

    #BOOL WINAPI SetHandleInformation(
    #  _In_  HANDLE hObject,
    #  _In_  DWORD dwMask,
    #  _In_  DWORD dwFlags )
    attach_function 'SetHandleInformation', [:handle, :dword, :dword], :bool
  end
end
