module WinFFI
  # The Process module includes process related functions and constants,
  # including some tool help functions that relate to processes.
  module Process
    extend LibBase

    ffi_lib 'kernel32'

    # Process access rights

    PROCESS_ALL_ACCESS                = 0x1F0FFF
    PROCESS_CREATE_PROCESS            = 0x0080
    PROCESS_CREATE_THREAD             = 0x0002
    PROCESS_DUP_HANDLE                = 0x0040
    PROCESS_QUERY_INFORMATION         = 0x0400
    PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
    PROCESS_SET_QUOTA                 = 0x0100
    PROCESS_SET_INFORMATION           = 0x0200
    PROCESS_SUSPEND_RESUME            = 0x0800
    PROCESS_TERMINATE                 = 0x0001
    PROCESS_VM_OPERATION              = 0x0008
    PROCESS_VM_READ                   = 0x0010
    PROCESS_VM_WRITE                  = 0x0020
    SYNCHRONIZE                       = 1048576
    STILL_ACTIVE                      = 259

    # Process priority flags

    ABOVE_NORMAL_PRIORITY_CLASS = 0x00008000
    BELOW_NORMAL_PRIORITY_CLASS = 0x00004000
    HIGH_PRIORITY_CLASS         = 0x00000080
    IDLE_PRIORITY_CLASS         = 0x00000040
    NORMAL_PRIORITY_CLASS       = 0x00000020
    REALTIME_PRIORITY_CLASS     = 0x00000100

    # Process creation flags

    CREATE_BREAKAWAY_FROM_JOB        = 0x01000000
    CREATE_DEFAULT_ERROR_MODE        = 0x04000000
    CREATE_NEW_CONSOLE               = 0x00000010
    CREATE_NEW_PROCESS_GROUP         = 0x00000200
    CREATE_NO_WINDOW                 = 0x08000000
    CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 0x02000000
    CREATE_SEPARATE_WOW_VDM          = 0x00000800
    CREATE_SHARED_WOW_VDM            = 0x00001000
    CREATE_SUSPENDED                 = 0x00000004
    CREATE_UNICODE_ENVIRONMENT       = 0x00000400
    DEBUG_ONLY_THIS_PROCESS          = 0x00000002
    DEBUG_PROCESS                    = 0x00000001
    DETACHED_PROCESS                 = 0x00000008

    STARTF_USESHOWWINDOW    = 0x00000001
    STARTF_USESIZE          = 0x00000002
    STARTF_USEPOSITION      = 0x00000004
    STARTF_USECOUNTCHARS    = 0x00000008
    STARTF_USEFILLATTRIBUTE = 0x00000010
    STARTF_RUNFULLSCREEN    = 0x00000020
    STARTF_FORCEONFEEDBACK  = 0x00000040
    STARTF_FORCEOFFFEEDBACK = 0x00000080
    STARTF_USESTDHANDLES    = 0x00000100
    STARTF_USEHOTKEY        = 0x00000200

    LOGON_WITH_PROFILE        = 0x00000001
    LOGON_NETCREDENTIALS_ONLY = 0x00000002

    SHUTDOWN_NORETRY = 0x00000001

    # Job Object Classes

    JobObjectBasicLimitInformation               = 2
    JobObjectBasicUIRestrictions                 = 4
    JobObjectSecurityLimitInformation            = 5
    JobObjectEndOfJobTimeInformation             = 6
    JobObjectAssociateCompletionPortInformation  = 7
    JobObjectExtendedLimitInformation            = 9
    JobObjectGroupInformation                    = 11

    # Job Limit Flags

    JOB_OBJECT_LIMIT_WORKINGSET                  = 0x00000001
    JOB_OBJECT_LIMIT_PROCESS_TIME                = 0x00000002
    JOB_OBJECT_LIMIT_JOB_TIME                    = 0x00000004
    JOB_OBJECT_LIMIT_ACTIVE_PROCESS              = 0x00000008
    JOB_OBJECT_LIMIT_AFFINITY                    = 0x00000010
    JOB_OBJECT_LIMIT_PRIORITY_CLASS              = 0x00000020
    JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME           = 0x00000040
    JOB_OBJECT_LIMIT_SCHEDULING_CLASS            = 0x00000080
    JOB_OBJECT_LIMIT_PROCESS_MEMORY              = 0x00000100
    JOB_OBJECT_LIMIT_JOB_MEMORY                  = 0x00000200
    JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION  = 0x00000400
    JOB_OBJECT_LIMIT_BREAKAWAY_OK                = 0x00000800
    JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK         = 0x00001000
    JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE           = 0x00002000

    # Job Access Rights

    JOB_OBJECT_ASSIGN_PROCESS          = 0x0001
    JOB_OBJECT_SET_ATTRIBUTES          = 0x0002
    JOB_OBJECT_QUERY                   = 0x0004
    JOB_OBJECT_TERMINATE               = 0x0008
    JOB_OBJECT_SET_SECURITY_ATTRIBUTES = 0x0010
    JOB_OBJECT_ALL_ACCESS              = 0x1F001F

    # Functions
    #attach_function :CreateProcessAsUser, 'LSPLLILPPPP', 'B', 'advapi32')
    #attach_function :CreateProcessWithLogonW, 'SSSLSPLLSPP', 'B', 'advapi32')
    #attach_function :WTSEnumerateProcesses, 'LLLPP', 'B', 'wtsapi32')

    # psapi, maybe
    #attach_function :EnumProcesses, [:pointer, :ulong, :pointer], :bool
    #attach_function :WaitForInputIdle, [:ulong, :ulong], :ulong

    #BOOL WINAPI AssignProcessToJobObject(
    #  _In_  HANDLE hJob,
    #  _In_  HANDLE hProcess )
    attach_function 'AssignProcessToJobObject', [:handle, :handle], :bool

    #HANDLE WINAPI CreateJobObject(
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpJobAttributes,
    #  _In_opt_  LPCTSTR lpName )
    attach_function 'CreateJobObjectA', [:pointer, :string], :ulong
    attach_function 'CreateJobObjectW', [:pointer, :string], :ulong

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
    attach_function 'CreateProcessA', [:string, :pointer, :pointer, :pointer, :bool, :dword, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function 'CreateProcessW', [:string, :pointer, :pointer, :pointer, :bool, :dword, :pointer, :pointer, :pointer, :pointer], :bool

    #VOID WINAPI ExitProcess( _In_  UINT uExitCode )
    attach_function 'ExitProcess', [:uint], :void

    #BOOL WINAPI FreeEnvironmentStrings( _In_  LPTCH lpszEnvironmentBlock )
    attach_function 'FreeEnvironmentStringsA', [:pointer], :bool
    attach_function 'FreeEnvironmentStringsW', [:pointer], :bool

    #LPTSTR WINAPI GetCommandLine(void)
    attach_function 'GetCommandLineA', [], :pointer
    attach_function 'GetCommandLineW', [], :pointer

    #HANDLE WINAPI GetCurrentProcess(void)
    attach_function 'GetCurrentProcess', [], :handle

    #DWORD WINAPI GetCurrentProcessId(void)
    attach_function 'GetCurrentProcessId', [], :ulong

    #LPTCH WINAPI GetEnvironmentStrings(void)
    attach_function 'GetEnvironmentStrings', [], :pointer

    #DWORD WINAPI GetEnvironmentVariable(
    #  _In_opt_   LPCTSTR lpName,
    #  _Out_opt_  LPTSTR lpBuffer,
    #  _In_       DWORD nSize )
    attach_function 'GetEnvironmentVariableA', [:string, :pointer, :dword], :dword
    attach_function 'GetEnvironmentVariableW', [:string, :pointer, :dword], :dword

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
    attach_function 'GetStartupInfoA', [:pointer], :void
    attach_function 'GetStartupInfoW', [:pointer], :void

    #HANDLE WINAPI OpenJobObject(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandles,
    #  _In_  LPCTSTR lpName )
    attach_function 'OpenJobObjectA', [:dword, :bool, :string], :handle
    attach_function 'OpenJobObjectW', [:dword, :bool, :string], :handle

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
    attach_function 'SetEnvironmentVariableA', [:string, :string], :bool
    attach_function 'SetEnvironmentVariableW', [:string, :string], :bool

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

    #Windows Store Apps
    #BOOL WINAPI SetProcessRestrictionExemption( BOOL fEnableExemption )
    #attach_function 'SetProcessRestrictionExemption', [:bool], :bool

    #BOOL WINAPI SetProcessShutdownParameters(
    #  _In_  DWORD dwLevel,
    #  _In_  DWORD dwFlags )
    attach_function 'SetProcessShutdownParameters', [:dword, :dword], :bool

    begin

      #DWORD WINAPI GetProcessId( _In_  HANDLE Process )
      attach_function 'GetProcessId', [:handle], :ulong

      #BOOL WINAPI GetProcessHandleCount(
      #  _In_     HANDLE hProcess,
      #  _Inout_  PDWORD pdwHandleCount )
      attach_function 'GetProcessHandleCount', [:handle, :pointer], :bool

      #BOOL WINAPI IsProcessInJob(
      #  _In_      HANDLE ProcessHandle,
      #  _In_opt_  HANDLE JobHandle,
      #  _Out_     PBOOL Result )
      attach_function 'IsProcessInJob', [:handle, :handle, :pointer], :bool

      #BOOL WINAPI IsWow64Process(
      #  _In_   HANDLE hProcess,
      #  _Out_  PBOOL Wow64Process )
      attach_function 'IsWow64Process', [:ulong, :pointer], :bool

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

    rescue FFI::NotFoundError
      # Windows XP or later
    end

    begin

      #BOOL WINAPI GetProcessWorkingSetSizeEx(
      #  _In_   HANDLE hProcess,
      #  _Out_  PSIZE_T lpMinimumWorkingSetSize,
      #  _Out_  PSIZE_T lpMaximumWorkingSetSize,
      #  _Out_  PDWORD Flags )
      attach_function 'GetProcessWorkingSetSizeEx', [:handle, :pointer, :pointer, :pointer], :ulong

    rescue FFI::NotFoundError
      # Windows Vista or later
    end

    # Helper method to determine if you're on a 64 bit version of Windows
    def windows_64?
      bool = false

      if respond_to?(:IsWow64Process, true)
        pbool = FFI::MemoryPointer.new(:int)

        # The IsWow64Process function will return false for a 64 bit process,
        # so we check using both the address size and IsWow64Process.
        if FFI::Platform::ADDRESS_SIZE == 64
          bool = true
        else
          if IsWow64Process(GetCurrentProcess(), pbool)
            bool = true if pbool.read_int == 1
          end
        end
      end

      bool
    end

    ffi_lib 'user32'


    #DWORD WINAPI GetGuiResources(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD uiFlags )
    attach_function 'GetGuiResources', [:handle, :dword], :dword

    #BOOL WINAPI IsImmersiveProcess( _In_  HANDLE hProcess )
    attach_function 'IsImmersiveProcess', [:handle], :bool

    #BOOL WINAPI UserHandleGrantAccess(
    #  _In_  HANDLE hUserHandle,
    #  _In_  HANDLE hJob,
    #  _In_  BOOL bGrant )
    attach_function 'UserHandleGrantAccess', [:handle, :handle, :bool], :bool

    #DWORD WINAPI WaitForInputIdle(
    #  _In_  HANDLE hProcess,
    #  _In_  DWORD dwMilliseconds )
    attach_function 'WaitForInputIdle', [:handle, :dword], :dword

  end
end