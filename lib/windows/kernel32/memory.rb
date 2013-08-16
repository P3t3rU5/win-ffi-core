module WinFFI
  module Kernel32
    module Memory
      extend LibBase
      ffi_lib 'kernel32'

      typedef :pointer, :hlocal

      GlobalFlags = enum :global_alloc_flags, [
          :GHND,          0x0042,
          :GMEM_FIXED,    0x0000,
          :GMEM_MOVABLE,  0002,
          :GMEM_ZEROINIT, 0x0040,
          :GPTR,          0x0040
      ]

      HeapFlags = enum :heap_flags, [
          :NO_SERIALIZE,          0x00000001,
          :GENERATE_EXCEPTIONS,   0x00000004,
          :ZERO_MEMORY,           0x00000008,
          :REALLOC_IN_PLACE_ONLY, 0x00000010,
          :CREATE_ENABLE_EXECUTE, 0x00040000
      ]

      MemoryFlags = enum :memory_flags, [
          :COMMIT,      0x1000,
          :RESERVE,     0x2000,
          :DECOMMIT,    0x4000,
          :RELEASE,     0x8000,
          :FREE,        0x10000,
          :PRIVATE,     0x20000,
          :MAPPED,      0x40000,
          :RESET,       0x80000,
          :TOP_DOWN,    0x100000,
          :WRITE_WATCH, 0x200000,
          :PHYSICAL,    0x400000,
          :LARGE_PAGES, 0x20000000,
          :N4MB_PAGES,  0x80000000200000
      ]

      MemoryProtectionConstants = enum :memory_protection_constants, [
          :NOACCESS,          0x01,
          :READONLY,          0x02,
          :READWRITE,         0x04,
          :WRITECOPY,         0x08,
          :EXECUTE,           0x10,
          :EXECUTE_READ,      0x20,
          :EXECUTE_READWRITE, 0x40,
          :EXECUTE_WRITECOPY, 0x80,
          :GUARD,             0x100,
          :NOCACHE,           0x200,
          :WRITECOMBINE,      0x400
      ]

      SEC_FILE     = 0x800000
      SEC_IMAGE    = 0x1000000
      SEC_VLM      = 0x2000000
      SEC_RESERVE  = 0x4000000
      SEC_COMMIT   = 0x8000000
      SEC_NOCACHE  = 0x10000000

      LocalFlags = enum :local_flags, [
          :FIXED,          0x0000,
          :MOVEABLE,       0x0002,
          :NOCOMPACT,      0x0010,
          :NODISCARD,      0x0020,
          :ZEROINIT,       0x0040,
          :MODIFY,         0x0080,
          :DISCARDABLE,    0x0F00,
          :VALID_FLAGS,    0x0F72,
          :INVALID_HANDLE, 0x8000,
          :DISCARDED,      0x4000,
          :LOCKCOUNT,      0x00FF
      ]

      #BOOL WINAPI AddSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
      attach_function 'AddSecureMemoryCacheCallback', [:pointer], :bool

      #Global
      #HGLOBAL WINAPI GlobalAlloc(
      #  _In_  UINT uFlags,
      #  _In_  SIZE_T dwBytes )
      attach_function 'GlobalAlloc', [GlobalFlags, :size_t], :hglobal

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

      #LPVOID WINAPI HeapReAlloc(
      #  _In_  HANDLE hHeap,
      #  _In_  DWORD dwFlags,
      #  _In_  LPVOID lpMem,
      #  _In_  SIZE_T dwBytes )
      attach_function 'HeapReAlloc', [:handle, HeapFlags, :pointer, :size_t], :pointer

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

      attach_function 'RtlZeroMemory', [:pointer, :size_t], :void

      # The LocalDiscard macro from winbase.h
      def LocalDiscard(mem_loc)
        LocalReAlloc(mem_loc, 0, :MOVEABLE)
      end

      begin
        #BOOL WINAPI HeapQueryInformation(
        #  _In_opt_   HANDLE HeapHandle,
        #  _In_       HEAP_INFORMATION_CLASS HeapInformationClass,
        #  _Out_      PVOID HeapInformation,
        #  _In_       SIZE_T HeapInformationLength,
        #  _Out_opt_  PSIZE_T ReturnLength )
        attach_function 'HeapQueryInformation', [:handle, :int, :pointer, :size_t, :pointer], :bool

        #BOOL WINAPI HeapSetInformation(
        #  _In_opt_  HANDLE HeapHandle,
        #  _In_      HEAP_INFORMATION_CLASS HeapInformationClass,
        #  _In_      PVOID HeapInformation,
        #  _In_      SIZE_T HeapInformationLength )
        attach_function 'HeapSetInformation', [:handle, :int, :pointer, :size_t], :bool
      rescue FFI::NotFoundError
        # Windows XP or later
      end
    end
  end
end