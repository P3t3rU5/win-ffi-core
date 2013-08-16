module WinFFI
  module Thread
    extend LibBase

    ffi_lib 'kernel32'

    SYNCHRONIZE                 = 0x00100000
    THREAD_ALL_ACCESS           = 0x1F03FF
    THREAD_DIRECT_IMPERSONATION = 0x0200
    THREAD_GET_CONTEXT          = 0x0008
    THREAD_IMPERSONATE          = 0x0100
    THREAD_QUERY_INFORMATION    = 0x0040
    THREAD_SET_CONTEXT          = 0x0010
    THREAD_SET_INFORMATION      = 0x0020
    THREAD_SET_THREAD_TOKEN     = 0x0080
    THREAD_SUSPEND_RESUME       = 0x0002
    THREAD_TERMINATE            = 0x0001

    THREAD_PRIORITY_ABOVE_NORMAL  = 1
    THREAD_PRIORITY_BELOW_NORMAL  = -1
    THREAD_PRIORITY_HIGHEST       = 2
    THREAD_PRIORITY_IDLE          = -15
    THREAD_PRIORITY_LOWEST        = -2
    THREAD_PRIORITY_NORMAL        = 0
    THREAD_PRIORITY_TIME_CRITICAL = 15

    #HANDLE WINAPI CreateRemoteThread(
    #  _In_   HANDLE hProcess,
    #  _In_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
    #  _In_   SIZE_T dwStackSize,
    #  _In_   LPTHREAD_START_ROUTINE lpStartAddress,
    #  _In_   LPVOID lpParameter,
    #  _In_   DWORD dwCreationFlags,
    #  _Out_  LPDWORD lpThreadId )
    attach_function 'CreateRemoteThread', [:handle, :pointer, :size_t, :pointer, :pointer, :dword, :pointer], :handle

    #HANDLE WINAPI CreateThread(
    #  _In_opt_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
    #  _In_       SIZE_T dwStackSize,
    #  _In_       LPTHREAD_START_ROUTINE lpStartAddress,
    #  _In_opt_   LPVOID lpParameter,
    #  _In_       DWORD dwCreationFlags,
    #  _Out_opt_  LPDWORD lpThreadId )
    attach_function 'CreateThread', [:pointer, :size_t, :pointer, :pointer, :dword, :pointer], :handle

    #VOID WINAPI ExitThread( _In_  DWORD dwExitCode )
    attach_function 'ExitThread', [:dword], :void

    #HANDLE WINAPI GetCurrentThread(void)
    attach_function 'GetCurrentThread', [], :handle

    #DWORD WINAPI GetCurrentThreadId(void)
    attach_function 'GetCurrentThreadId', [], :ulong

    #BOOL WINAPI GetExitCodeThread(
    #  _In_   HANDLE hThread,
    #  _Out_  LPDWORD lpExitCode )
    attach_function 'GetExitCodeThread', [:handle, :pointer], :bool

    #int WINAPI GetThreadPriority( _In_  HANDLE hThread )
    attach_function 'GetThreadPriority', [:handle], :int

    #BOOL WINAPI GetThreadPriorityBoost(
    #  _In_   HANDLE hThread,
    #  _Out_  PBOOL pDisablePriorityBoost )
    attach_function 'GetThreadPriorityBoost', [:pointer, :pointer], :bool

    #BOOL WINAPI GetThreadTimes(
    #  _In_   HANDLE hThread,
    #  _Out_  LPFILETIME lpCreationTime,
    #  _Out_  LPFILETIME lpExitTime,
    #  _Out_  LPFILETIME lpKernelTime,
    #  _Out_  LPFILETIME lpUserTime )
    attach_function 'GetThreadTimes', [:handle, :pointer, :pointer, :pointer, :pointer], :bool

    #HANDLE WINAPI OpenThread(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandle,
    #  _In_  DWORD dwThreadId )
    attach_function 'OpenThread', [:dword, :bool, :dword], :handle

    #DWORD WINAPI ResumeThread( _In_  HANDLE hThread )
    attach_function 'ResumeThread', [:handle], :dword

    attach_function 'SetThreadAffinityMask', [:ulong, :pointer], :ulong
    attach_function 'SetThreadIdealProcessor', [:ulong, :ulong], :ulong
    attach_function 'SetThreadPriority', [:ulong, :int], :bool
    attach_function 'SetThreadPriorityBoost', [:ulong, :bool], :bool
    attach_function 'Sleep', [:ulong], :void
    attach_function 'SleepEx', [:ulong, :bool], :ulong
    attach_function 'SuspendThread', [:ulong], :ulong
    attach_function 'SwitchToThread', [], :bool
    attach_function 'TerminateThread', [:ulong, :ulong], :bool
    attach_function 'TlsAlloc', [], :ulong
    attach_function 'TlsFree', [:ulong], :bool
    attach_function 'TlsGetValue', [:ulong], :ulong
    attach_function 'TlsSetValue', [:ulong, :ulong], :bool

    begin

      #HANDLE CreateRemoteThreadEx(
      #  _In_       HANDLE hProcess,
      #  _In_opt_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #  _In_       SIZE_T dwStackSize,
      #  _In_       LPTHREAD_START_ROUTINE lpStartAddress,
      #  _In_opt_   LPVOID lpParameter,
      #  _In_       DWORD dwCreationFlags,
      #  _In_opt_   LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
      #  _Out_opt_  LPDWORD lpThreadId )
      attach_function 'CreateRemoteThreadEx', [:handle, :pointer, :size_t, :pointer, :pointer, :dword, :pointer, :pointer], :bool

    rescue FFI::NotFoundError
      # Windows 7 or later
    end

    ffi_lib 'user32'

    begin

    #BOOL WINAPI AttachThreadInput(
    #  _In_  DWORD idAttach,
    #  _In_  DWORD idAttachTo,
    #  _In_  BOOL fAttach )
    attach_function 'AttachThreadInput', [:dword, :dword, :bool], :bool

      attach_function 'GetThreadIOPendingFlag', [:ulong, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end