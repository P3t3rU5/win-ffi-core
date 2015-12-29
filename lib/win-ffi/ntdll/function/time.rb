require 'win-ffi/ntdll'

module WinFFI
  module Ntdll
    #NTSTATUS WINAPI NtQuerySystemTime( _Out_  PLARGE_INTEGER SystemTime )
    attach_function 'NtQuerySystemTime', [:pointer], :int

    #NTSTATUS WINAPI RtlLocalTimeToSystemTime(
    #  _In_   PLARGE_INTEGER LocalTime,
    #  _Out_  PLARGE_INTEGER SystemTime )
    attach_function 'RtlLocalTimeToSystemTime', [:pointer, :pointer], :int

    #BOOLEAN WINAPI RtlTimeToSecondsSince1970(
    #  _In_   PLARGE_INTEGER Time,
    #  _Out_  PULONG ElapsedSeconds )
    attach_function 'RtlTimeToSecondsSince1970', [:pointer, :pointer], :bool
  end
end