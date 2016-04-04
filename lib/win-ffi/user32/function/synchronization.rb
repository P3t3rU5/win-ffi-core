require 'win-ffi/user32/enum/queue_status_flag'
require 'win-ffi/user32/enum/synchronization/msg_wait_for_multiple_objects_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684242(v=vs.85).aspx
    # DWORD WINAPI MsgWaitForMultipleObjects(
    #   _In_  DWORD nCount,
    #   _In_  const HANDLE *pHandles,
    #   _In_  BOOL bWaitAll,
    #   _In_  DWORD dwMilliseconds,
    #   _In_  DWORD dwWakeMask )
    attach_function 'MsgWaitForMultipleObjects', [:dword, :pointer, :bool, :dword, QueueStatusFlag], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684245(v=vs.85).aspx
    # DWORD WINAPI MsgWaitForMultipleObjectsEx(
    #   _In_  DWORD nCount,
    #   _In_  const HANDLE *pHandles,
    #   _In_  DWORD dwMilliseconds,
    #   _In_  DWORD dwWakeMask,
    #   _In_  DWORD dwFlags )
    attach_function 'MsgWaitForMultipleObjectsEx', [:dword, :pointer, :dword, QueueStatusFlag, MsgWaitForMultipleObjectsFlag], :dword
  end
end