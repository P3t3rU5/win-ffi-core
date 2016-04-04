require 'win-ffi/kernel32'

module WinFFI
  # The Process module includes process related functions and constants,
  # including some tool help functions that relate to processes.
  module Kernel32
    extend LibBase

    # Process creation flags

    DEBUG_ONLY_THIS_PROCESS          = 0x00000002
    DEBUG_PROCESS                    = 0x00000001
    DETACHED_PROCESS                 = 0x00000008

    LOGON_WITH_PROFILE        = 0x00000001
    LOGON_NETCREDENTIALS_ONLY = 0x00000002

    SHUTDOWN_NORETRY = 0x00000001

    # Job Object Classes

    JOB_OBJECT_BASIC_LIMIT_INFORMATION               =  2
    JOB_OBJECT_BASIC_UI_RESTRICTIONS                 =  4
    JOB_OBJECT_SECURITY_LIMIT_INFORMATION            =  5
    JOB_OBJECT_END_OF_JOB_TIME_INFORMATION           =  6
    JOB_OBJECT_ASSOCIATE_COMPLETION_PORT_INFORMATION =  7
    JOB_OBJECT_EXTENDED_LIMIT_INFORMATION            =  9
    JOB_OBJECT_GROUP_INFORMATION                     = 11


    begin
      ffi_lib 'kernel32'

      # psapi, maybe
      # BOOL WINAPI EnumProcesses(
      #   _Out_  DWORD *pProcessIds,
      #   _In_   DWORD cb,
      #   _Out_  DWORD *pBytesReturned )
      attach_function 'EnumProcesses', [:pointer, :dword, :pointer], :bool
    rescue FFI::FunctionNotFound

    end

    ffi_lib 'kernel32'

    #BOOL WINAPI AssignProcessToJobObject(
    #  _In_  HANDLE hJob,
    #  _In_  HANDLE hProcess )
    attach_function 'AssignProcessToJobObject', [:handle, :handle], :bool

    #HANDLE WINAPI CreateJobObject(
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpJobAttributes,
    #  _In_opt_  LPCTSTR lpName )
    encoded_function 'CreateJobObject', [:pointer, :string], :ulong

    #BOOL WINAPI CreateProcess(
    #  _In_opt_     LPCTSTR lpApplicationName,
    #  _Inout_opt_  LPTSTR lpCommandLine,
    #  _In_opt_     LPSECURITY_ATTRIBUTES lpProcessAttributes,
    #  _In_opt_     LPSECURITY_ATTRIBUTES lpThreadAttributes,
    #  _In_         BOOL bInheritHandles,
    #  _In_         DWORD dwCreationFlags,
    #  _In_opt_     LPVOID lpEnvironment,
    #  _In_opt_     LPCTSTR lpCurrentDirectory,
    #  _In_         LPSTARTUPINFO lpStartupInfo,
    #  _Out_        LPPROCESS_INFORMATION lpProcessInformation )
    encoded_function 'CreateProcess', [:string, :pointer, :pointer, :pointer, :bool, :dword, :pointer, :pointer, :pointer, :pointer], :bool

    #VOID WINAPI ExitProcess( _In_  UINT uExitCode )
    attach_function 'ExitProcess', [:uint], :void

    #BOOL WINAPI FreeEnvironmentStrings( _In_  LPTCH lpszEnvironmentBlock )
    encoded_function 'FreeEnvironmentStrings', [:pointer], :bool

    #LPTSTR WINAPI GetCommandLine(void)
    encoded_function 'GetCommandLine', [], :pointer

    #HANDLE WINAPI GetCurrentProcess(void)
    attach_function 'GetCurrentProcess', [], :handle

    #DWORD WINAPI GetCurrentProcessId(void)
    attach_function 'GetCurrentProcessId', [], :ulong

    #LPTCH WINAPI GetEnvironmentStrings(void)
    encoded_function 'GetEnvironmentStrings',  [], :pointer

    #DWORD WINAPI GetEnvironmentVariable(
    #  _In_opt_   LPCTSTR lpName,
    #  _Out_opt_  LPTSTR lpBuffer,
    #  _In_       DWORD nSize )
    encoded_function 'GetEnvironmentVariable', [:string, :pointer, :dword], :dword

    #BOOL WINAPI GetExitCodeProcess(
    #  _In_   HANDLE hProcess,
    #  _Out_  LPDWORD lpExitCode )
    attach_function 'GetExitCodeProcess', [:handle, :pointer], :bool

    #DWORD WINAPI GetPriorityClass( _In_  HANDLE hProcess )
    attach_function 'GetPriorityClass', [:handle], :dword

    #BOOL WINAPI GetProcessAffinityMask(
    #  _In_   HANDLE hProcess,
    #  _Out_  PDWORD_PTR lpProcessAffinityMask,
    #  _Out_  PDWORD_PTR lpSystemAffinityMask )
    attach_function 'GetProcessAffinityMask', [:handle, :pointer, :pointer], :bool

    #BOOL WINAPI GetProcessIoCounters(
    #  _In_   HANDLE hProcess,
    #  _Out_  PIO_COUNTERS lpIoCounters )
    attach_function 'GetProcessIoCounters', [:handle, :pointer], :bool

    #BOOL WINAPI GetProcessPriorityBoost(
    #  _In_   HANDLE hProcess,
    #  _Out_  PBOOL pDisablePriorityBoost )
    attach_function 'GetProcessPriorityBoost', [:handle, :pointer], :bool

    #BOOL WINAPI GetProcessShutdownParameters(
    #  _Out_  LPDWORD lpdwLevel,
    #  _Out_  LPDWORD lpdwFlags )
    attach_function 'GetProcessShutdownParameters', [:pointer, :pointer], :bool

    #BOOL WINAPI GetProcessTimes(
    #  _In_   HANDLE hProcess,
    #  _Out_  LPFILETIME lpCreationTime,
    #  _Out_  LPFILETIME lpExitTime,
    #  _Out_  LPFILETIME lpKernelTime,
    #  _Out_  LPFILETIME lpUserTime )
    attach_function 'GetProcessTimes', [:handle, :pointer, :pointer, :pointer, :pointer], :bool

    #DWORD WINAPI GetProcessVersion( _In_  DWORD ProcessId )
    attach_function 'GetProcessVersion', [:dword], :dword

    #BOOL WINAPI GetProcessWorkingSetSize(
    #  _In_   HANDLE hProcess,
    #  _Out_  PSIZE_T lpMinimumWorkingSetSize,
    #  _Out_  PSIZE_T lpMaximumWorkingSetSize )
    attach_function 'GetProcessWorkingSetSize', [:handle, :pointer, :pointer], :bool

    #VOID WINAPI GetStartupInfo( _Out_  LPSTARTUPINFO lpStartupInfo )
    encoded_function 'GetStartupInfo', [:pointer], :void

    #BOOL WINAPI IsProcessInJob(
    #  _In_      HANDLE ProcessHandle,
    #  _In_opt_  HANDLE JobHandle,
    #  _Out_     PBOOL Result )
    attach_function 'IsProcessInJob', [:handle, :handle, :pointer], :bool

    #HANDLE WINAPI OpenJobObject(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandles,
    #  _In_  LPCTSTR lpName )
    encoded_function 'OpenJobObject', [:dword, :bool, :string], :handle

    #HANDLE WINAPI OpenProcess(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandle,
    #  _In_  DWORD dwProcessId )
    attach_function 'OpenProcess', [:dword, :bool, :dword], :handle

    #BOOL WINAPI QueryInformationJobObject(
    #  _In_opt_   HANDLE hJob,
    #  _In_       JOBOBJECTINFOCLASS JobObjectInfoClass,
    #  _Out_      LPVOID lpJobObjectInfo,
    #  _In_       DWORD cbJobObjectInfoLength,
    #  _Out_opt_  LPDWORD lpReturnLength )
    attach_function 'QueryInformationJobObject', [:handle, :ulong, :pointer, :dword, :pointer], :bool

    #BOOL WINAPI SetEnvironmentVariable(
    #  _In_      LPCTSTR lpName,
    #  _In_opt_  LPCTSTR lpValue )
    encoded_function 'SetEnvironmentVariable', [:string, :string], :bool

    #TODO
    #BOOL WINAPI SetInformationJobObject(
    #  _In_  HANDLE hJob,
    #  _In_  JOBOBJECTINFOCLASS JobObjectInfoClass,
    #  _In_  LPVOID lpJobObjectInfo,
    #  _In_  DWORD cbJobObjectInfoLength )
    attach_function 'SetInformationJobObject', [:handle, :ulong, :pointer, :dword], :bool

    #BOOL WINAPI SetPriorityClass(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD dwPriorityClass )
    attach_function 'SetPriorityClass', [:handle, :dword], :bool

    #BOOL WINAPI SetProcessAffinityMask(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD_PTR dwProcessAffinityMask )
    attach_function 'SetProcessAffinityMask', [:handle, :dword], :bool

    #BOOL WINAPI SetProcessPriorityBoost(
    #  _In_  HANDLE hProcess,
    #  _In_  BOOL DisablePriorityBoost )
    attach_function 'SetProcessPriorityBoost', [:handle, :bool], :bool

    #BOOL WINAPI SetProcessShutdownParameters(
    #  _In_  DWORD dwLevel,
    #  _In_  DWORD dwFlags )
    attach_function 'SetProcessShutdownParameters', [:dword, :dword], :bool

    #BOOL WINAPI SetProcessWorkingSetSize(
    #  _In_  HANDLE hProcess,
    #  _In_  SIZE_T dwMinimumWorkingSetSize,
    #  _In_  SIZE_T dwMaximumWorkingSetSize )
    attach_function 'SetProcessWorkingSetSize', [:handle, :size_t, :size_t], :bool

    #BOOL WINAPI TerminateJobObject(
    #  _In_  HANDLE hJob,
    #  _In_  UINT uExitCode )
    attach_function 'TerminateJobObject', [:handle, :uint], :bool

    #BOOL WINAPI TerminateProcess(
    #  _In_  HANDLE hProcess,
    #  _In_  UINT uExitCode )
    attach_function 'TerminateProcess', [:ulong, :uint], :bool

    if WindowsVersion.sp >= 1 || WindowsVersion >= :vista

      #BOOL WINAPI GetProcessHandleCount(
      #  _In_     HANDLE hProcess,
      #  _Inout_  PDWORD pdwHandleCount )
      attach_function 'GetProcessHandleCount', [:handle, :pointer], :bool

      #DWORD WINAPI GetProcessId( _In_  HANDLE Process )
      attach_function 'GetProcessId', [:handle], :ulong

      if WindowsVersion.sp >= 2 || WindowsVersion >= :vista

        #BOOL WINAPI IsWow64Process(
        #  _In_   HANDLE hProcess,
        #  _Out_  PBOOL Wow64Process )
        attach_function 'IsWow64Process', [:ulong, :pointer], :bool

      end
    end

    if WindowsVersion >= :vista

      #BOOL WINAPI GetProcessWorkingSetSizeEx(
      #  _In_   HANDLE hProcess,
      #  _Out_  PSIZE_T lpMinimumWorkingSetSize,
      #  _Out_  PSIZE_T lpMaximumWorkingSetSize,
      #  _Out_  PDWORD Flags )
      attach_function 'GetProcessWorkingSetSizeEx', [:handle, :pointer, :pointer, :pointer], :ulong
    end
  end
end