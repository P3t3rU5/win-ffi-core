require 'win-ffi/avrt'

module WinFFI
  module Avrt
    if WindowsVersion >= 7

      #BOOL WINAPI AvRevertMmThreadCharacteristics( _In_  HANDLE AvrtHandle )
      attach_function 'AvRevertMmThreadCharacteristics', [:handle], :bool

      #BOOL WINAPI AvRtCreateThreadOrderingGroup(
      #  _Out_     PHANDLE Context,
      #  _In_      PLARGE_INTEGER Period,
      #  _Inout_   GUID *ThreadOrderingGuid,
      #  _In_opt_  PLARGE_INTEGER Timeout )
      attach_function 'AvRtCreateThreadOrderingGroup', [:pointer, :pointer, :pointer, :pointer], :bool

      #BOOL WINAPI AvRtCreateThreadOrderingGroupEx(
      #  _Out_     PHANDLE Context,
      #  _In_      PLARGE_INTEGER Period,
      #  _Inout_   GUID *ThreadOrderingGuid,
      #  _In_opt_  PLARGE_INTEGER Timeout,
      #  _In_      LPCTSTR TaskName )
      encoded_function 'AvRtCreateThreadOrderingGroupEx', [:pointer, :pointer, :pointer, :pointer, :string], :bool

      #BOOL WINAPI AvRtDeleteThreadOrderingGroup( _In_  HANDLE Context )
      attach_function 'AvRtDeleteThreadOrderingGroup', [:handle], :bool

      #BOOL WINAPI AvRtJoinThreadOrderingGroup(
      #  _Out_  PHANDLE Context,
      #  _In_   GUID *ThreadOrderingGuid,
      #  _In_   BOOL Before )
      attach_function 'AvRtJoinThreadOrderingGroup', [:pointer, :pointer, :bool], :bool

      #BOOL WINAPI AvRtWaitOnThreadOrderingGroup( _In_  HANDLE Context )
      attach_function 'AvRtWaitOnThreadOrderingGroup', [:handle], :bool

      #HANDLE WINAPI AvSetMmMaxThreadCharacteristics(
      #  _In_     LPCTSTR FirstTask,
      #  _In_     LPCTSTR SecondTask,
      #  _Inout_  LPDWORD TaskIndex )
      encoded_function 'AvSetMmMaxThreadCharacteristics', [:string, :string, :pointer], :handle

      #HANDLE WINAPI AvSetMmThreadCharacteristics(
      #  _In_     LPCTSTR TaskName,
      #  _Inout_  LPDWORD TaskIndex )
      encoded_function 'AvSetMmThreadCharacteristics', [:string, :pointer], :handle

      #BOOL WINAPI AvSetMmThreadPriority(
      #  _In_  HANDLE AvrtHandle,
      #  _In_  AVRT_PRIORITY Priority )
      attach_function 'AvSetMmThreadPriority', [:handle, :int], :bool

    end
  end
end