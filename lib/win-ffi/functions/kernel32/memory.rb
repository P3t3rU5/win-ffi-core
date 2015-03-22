require_relative '../../enums/kernel32/global_alloc_flags'
require_relative '../../enums/kernel32/heap_flags'
require_relative '../../enums/kernel32/local_flags'
require_relative '../../enums/kernel32/memory_flags'
require_relative '../../enums/kernel32/memory_protection_constants'

module WinFFI
  module Kernel32

    typedef :pointer, :hlocal

    #BOOL WINAPI AddSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
    attach_function 'AddSecureMemoryCacheCallback', [:pointer], :bool

    #BOOL WINAPI AllocateUserPhysicalPages(
    #  _In_     HANDLE hProcess,
    #  _Inout_  PULONG_PTR NumberOfPages,
    #  _Out_    PULONG_PTR UserPfnArray )
    attach_function 'AllocateUserPhysicalPages', [:handle, :pointer, :pointer], :bool

    #BOOL WINAPI AllocateUserPhysicalPagesNuma(
    #  _In_     HANDLE hProcess,
    #  _Inout_  PULONG_PTR NumberOfPages,
    #  _Out_    PULONG_PTR PageArray,
    #  _In_     DWORD nndPreferred )
    attach_function 'AllocateUserPhysicalPagesNuma', [:handle, :pointer, :pointer, :dword], :bool

    #void CopyMemory(
    #  _In_  PVOID Destination,
    #  _In_  const VOID *Source,
    #  _In_  SIZE_T Length )
    #attach_function 'RtlCopyMemory', [:pointer, :pointer, :size_t], :void

    #HANDLE WINAPI CreateFileMapping(
    #  _In_      HANDLE hFile,
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpAttributes,
    #  _In_      DWORD flProtect,
    #  _In_      DWORD dwMaximumSizeHigh,
    #  _In_      DWORD dwMaximumSizeLow,
    #  _In_opt_  LPCTSTR lpName )
    attach_function 'CreateFileMappingA', [:handle, :pointer, :dword, :dword, :dword, :string], :handle
    attach_function 'CreateFileMappingW', [:handle, :pointer, :dword, :dword, :dword, :string], :handle

    #HANDLE WINAPI CreateFileMappingNuma(
    #  _In_      HANDLE hFile,
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
    #  _In_      DWORD flProtect,
    #  _In_      DWORD dwMaximumSizeHigh,
    #  _In_      DWORD dwMaximumSizeLow,
    #  _In_opt_  LPCTSTR lpName,
    #  _In_      DWORD nndPreferred )
    attach_function 'CreateFileMappingNumaA', [:handle, :pointer, :dword, :dword, :dword, :string, :dword], :handle
    attach_function 'CreateFileMappingNumaW', [:handle, :pointer, :dword, :dword, :dword, :string, :dword], :handle

    #HANDLE WINAPI CreateMemoryResourceNotification( _In_  MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType )
    attach_function 'CreateMemoryResourceNotification', [:int], :handle

    #void FillMemory(
    #  [out]  PVOID Destination,
    #  [in]   SIZE_T Length,
    #  [in]   BYTE Fill )
    attach_function 'RtlFillMemory', [:pointer, :size_t, :byte], :void

    #BOOL WINAPI FlushViewOfFile(
    #  _In_  LPCVOID lpBaseAddress,
    #  _In_  SIZE_T dwNumberOfBytesToFlush )
    attach_function 'FlushViewOfFile', [:pointer, :size_t], :bool

    #BOOL WINAPI FreeUserPhysicalPages(
    #  _In_     HANDLE hProcess,
    #  _Inout_  PULONG_PTR NumberOfPages,
    #  _In_     PULONG_PTR UserPfnArray )
    attach_function 'FreeUserPhysicalPages', [:handle, :pointer, :pointer], :bool

    #SIZE_T WINAPI GetLargePageMinimum(void)
    attach_function 'GetLargePageMinimum', [], :size_t

    #BOOL WINAPI GetPhysicallyInstalledSystemMemory( _Out_  PULONGLONG TotalMemoryInKilobytes )
    attach_function 'GetPhysicallyInstalledSystemMemory', [:pointer], :bool

    #BOOL WINAPI GetProcessDEPPolicy(
    #  _In_   HANDLE hProcess,
    #  _Out_  LPDWORD lpFlags,
    #  _Out_  PBOOL lpPermanent )
    attach_function 'GetProcessDEPPolicy', [:handle, :pointer, :pointer], :bool

    #DEP_SYSTEM_POLICY_TYPE WINAPI GetSystemDEPPolicy(void)
    attach_function 'GetSystemDEPPolicy', [], :uint

    #BOOL WINAPI GetSystemFileCacheSize(
    #  _Out_  PSIZE_T lpMinimumFileCacheSize,
    #  _Out_  PSIZE_T lpMaximumFileCacheSize,
    #  _Out_  PDWORD lpFlags )
    attach_function 'GetSystemFileCacheSize', [:pointer, :pointer, :pointer], :bool

    #UINT WINAPI GetWriteWatch(
    #  _In_     DWORD dwFlags,
    #  _In_     PVOID lpBaseAddress,
    #  _In_     SIZE_T dwRegionSize,
    #  _Out_    PVOID *lpAddresses,
    #  _Inout_  PULONG_PTR lpdwCount,
    #  _Out_    PULONG lpdwGranularity )
    attach_function 'GetWriteWatch', [:dword, :pointer, :size_t, :pointer, :pointer, :pointer], :uint

    #BOOL WINAPI IsBadCodePtr( _In_  FARPROC lpfn )
    attach_function 'IsBadCodePtr', [:pointer], :bool

    #BOOL WINAPI IsBadReadPtr(
    #  _In_  const VOID *lp,
    #  _In_  UINT_PTR ucb )
    attach_function 'IsBadReadPtr', [:pointer, :uint], :bool

    #BOOL WINAPI IsBadStringPtr(
    #  _In_  LPCTSTR lpsz,
    #  _In_  UINT_PTR ucchMax )
    attach_function 'IsBadStringPtrA', [:string, :uint], :bool
    attach_function 'IsBadStringPtrW', [:string, :uint], :bool

    #BOOL WINAPI IsBadWritePtr(
    #  _In_  LPVOID lp,
    #  _In_  UINT_PTR ucb )
    attach_function 'IsBadWritePtr', [:pointer, :uint], :bool

    #LPVOID WINAPI MapViewOfFile(
    #  _In_  HANDLE hFileMappingObject,
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  DWORD dwFileOffsetHigh,
    #  _In_  DWORD dwFileOffsetLow,
    #  _In_  SIZE_T dwNumberOfBytesToMap )
    attach_function 'MapViewOfFile', [:handle, :dword, :dword, :dword, :size_t], :pointer

    #LPVOID WINAPI MapViewOfFileEx(
    #  _In_      HANDLE hFileMappingObject,
    #  _In_      DWORD dwDesiredAccess,
    #  _In_      DWORD dwFileOffsetHigh,
    #  _In_      DWORD dwFileOffsetLow,
    #  _In_      SIZE_T dwNumberOfBytesToMap,
    #  _In_opt_  LPVOID lpBaseAddress )
    attach_function 'MapViewOfFileEx', [:handle, :dword, :dword, :dword, :size_t, :pointer], :pointer

    #LPVOID WINAPI MapViewOfFileExNuma(
    #  _In_      HANDLE hFileMappingObject,
    #  _In_      DWORD dwDesiredAccess,
    #  _In_      DWORD dwFileOffsetHigh,
    #  _In_      DWORD dwFileOffsetLow,
    #  _In_      SIZE_T dwNumberOfBytesToMap,
    #  _In_opt_  LPVOID lpBaseAddress,
    #  _In_      DWORD nndPreferred )
    attach_function 'MapViewOfFileExNuma', [:handle, :dword, :dword, :dword, :size_t, :pointer, :dword], :pointer

    #BOOL WINAPI MapUserPhysicalPages(
    #  _In_  PVOID lpAddress,
    #  _In_  ULONG_PTR NumberOfPages,
    #  _In_  PULONG_PTR UserPfnArray )
    attach_function 'MapUserPhysicalPages', [:pointer, :ulong, :pointer], :bool

    #BOOL WINAPI MapUserPhysicalPagesScatter(
    #  _In_  PVOID *VirtualAddresses,
    #  _In_  ULONG_PTR NumberOfPages,
    #  _In_  PULONG_PTR PageArray )
    attach_function 'MapUserPhysicalPagesScatter', [:pointer, :ulong, :pointer], :bool

    #void MoveMemory(
    #  _In_  PVOID Destination,
    #  _In_  const VOID *Source,
    #  _In_  SIZE_T Length )
    attach_function 'RtlMoveMemory', [:pointer, :pointer, :size_t], :void

    #HANDLE WINAPI OpenFileMapping(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandle,
    #  _In_  LPCTSTR lpName )
    attach_function 'OpenFileMappingA', [:dword, :bool, :string], :handle
    attach_function 'OpenFileMappingW', [:dword, :bool, :string], :handle

    #BOOL WINAPI QueryMemoryResourceNotification(
    #  _In_   HANDLE ResourceNotificationHandle,
    #  _Out_  PBOOL ResourceState )
    attach_function 'QueryMemoryResourceNotification', [:handle, :pointer], :bool


    #BOOL WINAPI RemoveSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
    attach_function 'RemoveSecureMemoryCacheCallback', [:pointer], :bool

    #UINT WINAPI ResetWriteWatch(
    #  _In_  LPVOID lpBaseAddress,
    #  _In_  SIZE_T dwRegionSize )
    attach_function 'ResetWriteWatch', [:pointer, :size_t], :uint

    #BOOLEAN CALLBACK SecureMemoryCacheCallback(
    #  _In_  PVOID Addr,
    #  _In_  SIZE_T Range )
    callback 'SecureMemoryCacheCallback', [:pointer, :size_t], :bool

    #PVOID SecureZeroMemory(
    #  _In_  PVOID ptr,
    #  _In_  SIZE_T cnt )
    #attach_function 'SecureZeroMemory', [:pointer, :size_t], :pointer

    #BOOL WINAPI SetProcessDEPPolicy( _In_  DWORD dwFlags )
    attach_function 'SetProcessDEPPolicy', [:dword], :bool

    #BOOL WINAPI SetSystemFileCacheSize(
    #  _In_  SIZE_T MinimumFileCacheSize,
    #  _In_  SIZE_T MaximumFileCacheSize,
    #  _In_  DWORD Flags )
    attach_function 'SetSystemFileCacheSize', [:size_t, :size_t, :dword], :bool

    #BOOL WINAPI UnmapViewOfFile( _In_  LPCVOID lpBaseAddress )
    attach_function 'UnmapViewOfFile', [:pointer], :bool

    #Global
    #HGLOBAL WINAPI GlobalAlloc(
    #  _In_  UINT uFlags,
    #  _In_  SIZE_T dwBytes )
    attach_function 'GlobalAlloc', [GlobalAllocFlags, :size_t], :hglobal

    #UINT WINAPI GlobalFlags( _In_  HGLOBAL hMem )
    attach_function 'GlobalFlags', [:hglobal], :uint

    #HGLOBAL WINAPI GlobalFree( _In_  HGLOBAL hMem )
    attach_function 'GlobalFree', [:hglobal], :hglobal

    #HGLOBAL WINAPI GlobalHandle( _In_  LPCVOID pMem )
    attach_function 'GlobalHandle', [:pointer], :hglobal

    #LPVOID WINAPI GlobalLock( _In_  HGLOBAL hMem )
    attach_function 'GlobalLock', [:hglobal], :pointer

    #void WINAPI GlobalMemoryStatus( _Out_  LPMEMORYSTATUS lpBuffer )
    attach_function 'GlobalMemoryStatus', [:pointer], :void

    #BOOL WINAPI GlobalMemoryStatusEx( _Inout_  LPMEMORYSTATUSEX lpBuffer )
    attach_function 'GlobalMemoryStatusEx', [:pointer], :bool

    #HGLOBAL WINAPI GlobalReAlloc(
    #  _In_  HGLOBAL hMem,
    #  _In_  SIZE_T dwBytes,
    #  _In_  UINT uFlags )
    attach_function 'GlobalReAlloc', [:hglobal, :size_t, :uint], :hglobal

    #SIZE_T WINAPI GlobalSize( _In_  HGLOBAL hMem )
    attach_function 'GlobalSize', [:hglobal], :size_t

    #BOOL WINAPI GlobalUnlock( _In_  HGLOBAL hMem )
    attach_function 'GlobalUnlock', [:hglobal], :bool


    #Heap
    #HANDLE WINAPI GetProcessHeap(void)
    attach_function 'GetProcessHeap', [:void], :handle

    #DWORD WINAPI GetProcessHeaps(
    #  _In_   DWORD NumberOfHeaps,
    #  _Out_  PHANDLE ProcessHeaps )
    attach_function 'GetProcessHeaps', [:dword, :pointer], :dword

    #LPVOID WINAPI HeapAlloc(
    #  _In_  HANDLE hHeap,
    #  _In_  DWORD dwFlags,
    #  _In_  SIZE_T dwBytes )
    attach_function 'HeapAlloc', [:handle, HeapFlags, :size_t], :pointer

    #SIZE_T WINAPI HeapCompact(
    #  _In_  HANDLE hHeap,
    #  _In_  DWORD dwFlags )
    attach_function 'HeapCompact', [:handle, HeapFlags], :size_t

    #HANDLE WINAPI HeapCreate(
    #  _In_  DWORD flOptions,
    #  _In_  SIZE_T dwInitialSize,
    #  _In_  SIZE_T dwMaximumSize )
    attach_function 'HeapCreate', [HeapFlags, :size_t, :size_t], :handle

    #BOOL WINAPI HeapDestroy( _In_  HANDLE hHeap )
    attach_function 'HeapDestroy', [:handle], :bool

    #BOOL WINAPI HeapFree(
    #  _In_  HANDLE hHeap,
    #  _In_  DWORD dwFlags,
    #  _In_  LPVOID lpMem )
    attach_function 'HeapFree', [:handle, HeapFlags, :pointer], :bool

    #BOOL WINAPI HeapLock( _In_  HANDLE hHeap )
    attach_function 'HeapLock', [:handle], :bool

    #BOOL WINAPI HeapQueryInformation(
    #  _In_opt_   HANDLE HeapHandle,
    #  _In_       HEAP_INFORMATION_CLASS HeapInformationClass,
    #  _Out_      PVOID HeapInformation,
    #  _In_       SIZE_T HeapInformationLength,
    #  _Out_opt_  PSIZE_T ReturnLength )
    attach_function 'HeapQueryInformation', [:handle, :int, :pointer, :size_t, :pointer], :bool

    #LPVOID WINAPI HeapReAlloc(
    #  _In_  HANDLE hHeap,
    #  _In_  DWORD dwFlags,
    #  _In_  LPVOID lpMem,
    #  _In_  SIZE_T dwBytes )
    attach_function 'HeapReAlloc', [:handle, HeapFlags, :pointer, :size_t], :pointer

    #BOOL WINAPI HeapSetInformation(
    #  _In_opt_  HANDLE HeapHandle,
    #  _In_      HEAP_INFORMATION_CLASS HeapInformationClass,
    #  _In_      PVOID HeapInformation,
    #  _In_      SIZE_T HeapInformationLength )
    attach_function 'HeapSetInformation', [:handle, :int, :pointer, :size_t], :bool

    #SIZE_T WINAPI HeapSize(
    #  _In_  HANDLE hHeap,
    #  _In_  DWORD dwFlags,
    #  _In_  LPCVOID lpMem )
    attach_function 'HeapSize', [:handle, HeapFlags, :pointer], :size_t

    #BOOL WINAPI HeapUnlock( _In_  HANDLE hHeap )
    attach_function 'HeapUnlock', [:handle], :bool

    #BOOL WINAPI HeapValidate(
    #  _In_      HANDLE hHeap,
    #  _In_      DWORD dwFlags,
    #  _In_opt_  LPCVOID lpMem )
    attach_function 'HeapValidate', [:handle, HeapFlags, :pointer], :bool

    #BOOL WINAPI HeapWalk(
    #  _In_     HANDLE hHeap,
    #  _Inout_  LPPROCESS_HEAP_ENTRY lpEntry )
    attach_function 'HeapWalk', [:handle, :pointer], :bool


    #Local
    #HLOCAL WINAPI LocalAlloc(
    #  _In_  UINT uFlags,
    #  _In_  SIZE_T uBytes )
    attach_function 'LocalAlloc', [LocalFlags, :size_t], :ulong

    #UINT WINAPI LocalFlags( _In_  HLOCAL hMem )
    attach_function 'LocalFlags', [:hlocal], :uint

    #HLOCAL WINAPI LocalFree( _In_  HLOCAL hMem )
    attach_function 'LocalFree', [:hlocal], :hlocal

    #HLOCAL WINAPI LocalHandle( _In_  LPCVOID pMem )
    attach_function 'LocalHandle', [:pointer], :hlocal

    #LPVOID WINAPI LocalLock( _In_  HLOCAL hMem )
    attach_function 'LocalLock', [:hlocal], :pointer

    #HLOCAL WINAPI LocalReAlloc(
    #  _In_  HLOCAL hMem,
    #  _In_  SIZE_T uBytes,
    #  _In_  UINT uFlags )
    attach_function 'LocalReAlloc', [:hlocal, :size_t, LocalFlags], :hlocal

    #UINT WINAPI LocalSize( _In_  HLOCAL hMem )
    attach_function 'LocalSize', [:hlocal], :uint

    #BOOL WINAPI LocalUnlock( _In_  HLOCAL hMem )
    attach_function 'LocalUnlock', [:hlocal], :bool


    #Virtual
    #LPVOID WINAPI VirtualAlloc(
    #  _In_opt_  LPVOID lpAddress,
    #  _In_      SIZE_T dwSize,
    #  _In_      DWORD flAllocationType,
    #  _In_      DWORD flProtect )
    attach_function 'VirtualAlloc', [:pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

    #LPVOID WINAPI VirtualAllocEx(
    #  _In_      HANDLE hProcess,
    #  _In_opt_  LPVOID lpAddress,
    #  _In_      SIZE_T dwSize,
    #  _In_      DWORD flAllocationType,
    #  _In_      DWORD flProtect )
    attach_function 'VirtualAllocEx', [:handle, :pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

    #LPVOID WINAPI VirtualAllocExNuma(
    #  _In_      HANDLE hProcess,
    #  _In_opt_  LPVOID lpAddress,
    #  _In_      SIZE_T dwSize,
    #  _In_      DWORD flAllocationType,
    #  _In_      DWORD flProtect,
    #  _In_      DWORD nndPreferred )
    attach_function 'VirtualAllocExNuma', [:handle, :pointer, :size_t, :dword, :dword, :dword], :pointer

    #BOOL WINAPI VirtualFree(
    #  _In_  LPVOID lpAddress,
    #  _In_  SIZE_T dwSize,
    #  _In_  DWORD dwFreeType )
    attach_function 'VirtualFree', [:pointer, :size_t, MemoryFlags], :bool

    #BOOL WINAPI VirtualFreeEx(
    #  _In_  HANDLE hProcess,
    #  _In_  LPVOID lpAddress,
    #  _In_  SIZE_T dwSize,
    #  _In_  DWORD dwFreeType )
    attach_function 'VirtualFreeEx', [:handle, :pointer, :size_t, MemoryFlags], :bool

    #BOOL WINAPI VirtualLock(
    #  _In_  LPVOID lpAddress,
    #  _In_  SIZE_T dwSize )
    attach_function 'VirtualLock', [:pointer, :size_t], :bool

    #BOOL WINAPI VirtualProtect(
    #  _In_   LPVOID lpAddress,
    #  _In_   SIZE_T dwSize,
    #  _In_   DWORD flNewProtect,
    #  _Out_  PDWORD lpflOldProtect )
    attach_function 'VirtualProtect', [:pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

    #BOOL WINAPI VirtualProtectEx(
    #  _In_   HANDLE hProcess,
    #  _In_   LPVOID lpAddress,
    #  _In_   SIZE_T dwSize,
    #  _In_   DWORD flNewProtect,
    #  _Out_  PDWORD lpflOldProtect )
    attach_function 'VirtualProtectEx', [:handle, :pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

    #SIZE_T WINAPI VirtualQuery(
    #  _In_opt_  LPCVOID lpAddress,
    #  _Out_     PMEMORY_BASIC_INFORMATION lpBuffer,
    #  _In_      SIZE_T dwLength )
    attach_function 'VirtualQuery', [:pointer, :pointer, :size_t], :size_t

    #SIZE_T WINAPI VirtualQueryEx(
    #  _In_      HANDLE hProcess,
    #  _In_opt_  LPCVOID lpAddress,
    #  _Out_     PMEMORY_BASIC_INFORMATION lpBuffer,
    #  _In_      SIZE_T dwLength )
    attach_function 'VirtualQueryEx', [:handle, :pointer, :pointer, :size_t], :size_t

    #BOOL WINAPI VirtualUnlock(
    #  _In_  LPVOID lpAddress,
    #  _In_  SIZE_T dwSize )
    attach_function 'VirtualUnlock', [:pointer, :size_t], :bool

    #void ZeroMemory(
    #  [in]  PVOID Destination,
    #  [in]  SIZE_T Length )
    attach_function 'RtlZeroMemory', [:pointer, :size_t], :void

    if WinFFI::WindowsVersion >= 8

      #HANDLE WINAPI CreateFileMappingFromApp(
      #  _In_      HANDLE hFile,
      #  _In_opt_  PSECURITY_ATTRIBUTES SecurityAttributes,
      #  _In_      ULONG PageProtection,
      #  _In_      ULONG64 MaximumSize,
      #  _In_opt_  PCWSTR Name )
      attach_function 'CreateFileMappingFromApp', [:handle, :pointer, :ulong, :ulong, :string], :handle

      #BOOL WINAPI GetMemoryErrorHandlingCapabilities( _Out_  PULONG Capabilities )
      attach_function 'GetMemoryErrorHandlingCapabilities', [:pointer], :bool

      #PVOID WINAPI MapViewOfFileFromApp(
      #  _In_  HANDLE hFileMappingObject,
      #  _In_  ULONG DesiredAccess,
      #  _In_  ULONG64 FileOffset,
      #  _In_  SIZE_T NumberOfBytesToMap )
      attach_function 'MapViewOfFileFromApp', [:handle, :ulong, :ulong, :size_t], :pointer

      #BOOL WINAPI PrefetchVirtualMemory(
      #  _In_  HANDLE hProcess,
      #  _In_  ULONG_PTR NumberOfEntries,
      #  _In_  PWIN32_MEMORY_RANGE_ENTRY VirtualAddresses,
      #  _In_  ULONG Flags )
      attach_function 'PrefetchVirtualMemory', [:handle, :ulong, :pointer, :ulong], :bool

      #PVOID WINAPI RegisterBadMemoryNotification( _In_  PBAD_MEMORY_CALLBACK_ROUTINE Callback )
      attach_function 'RegisterBadMemoryNotification', [:pointer], :pointer

      #BOOL WINAPI UnregisterBadMemoryNotification( _In_  PVOID RegistrationHandle )
      attach_function 'UnregisterBadMemoryNotification', [:pointer], :bool
    end
  end
end