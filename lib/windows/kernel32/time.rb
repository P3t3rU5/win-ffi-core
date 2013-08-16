module WinFFI
  module Kernel32
    module Time
      extend LibBase
      ffi_lib 'kernel32'

      private

      TIME_ZONE_ID_UNKNOWN  = 0
      TIME_ZONE_ID_STANDARD = 1
      TIME_ZONE_ID_DAYLIGHT = 2

      #LONG WINAPI CompareFileTime(
      #  _In_  const FILETIME *lpFileTime1,
      #  _In_  const FILETIME *lpFileTime2 )
      attach_function :CompareFileTime, [:pointer, :pointer], :long

      #BOOL WINAPI DosDateTimeToFileTime(
      #  _In_   WORD wFatDate,
      #  _In_   WORD wFatTime,
      #  _Out_  LPFILETIME lpFileTime )
      attach_function :DosDateTimeToFileTime, [:ushort, :ushort], :bool

      #BOOL WINAPI FileTimeToDosDateTime(
      #  _In_   const FILETIME *lpFileTime,
      #  _Out_  LPWORD lpFatDate,
      #  _Out_  LPWORD lpFatTime )
      attach_function :FileTimeToDosDateTime, [:pointer, :pointer, :pointer], :bool

      #BOOL WINAPI FileTimeToLocalFileTime(
      #  _In_   const FILETIME *lpFileTime,
      #  _Out_  LPFILETIME lpLocalFileTime )
      attach_function :FileTimeToLocalFileTime, [:pointer, :pointer], :bool

      #BOOL WINAPI FileTimeToSystemTime(
      #  _In_   const FILETIME *lpFileTime,
      #  _Out_  LPSYSTEMTIME lpSystemTime )
      attach_function :FileTimeToSystemTime, [:pointer, :pointer], :bool

      #BOOL WINAPI GetFileTime(
      #  _In_       HANDLE hFile,
      #  _Out_opt_  LPFILETIME lpCreationTime,
      #  _Out_opt_  LPFILETIME lpLastAccessTime,
      #  _Out_opt_  LPFILETIME lpLastWriteTime )
      attach_function :GetFileTime, [:handle, :pointer, :pointer, :pointer], :bool

      #void WINAPI GetLocalTime( _Out_  LPSYSTEMTIME lpSystemTime )
      attach_function :GetLocalTime, [:pointer], :void

      #void WINAPI GetSystemTime( _Out_  LPSYSTEMTIME lpSystemTime )
      attach_function :GetSystemTime, [:pointer], :void

      #BOOL WINAPI GetSystemTimeAdjustment(
      #  _Out_  PDWORD lpTimeAdjustment,
      #  _Out_  PDWORD lpTimeIncrement,
      #  _Out_  PBOOL lpTimeAdjustmentDisabled )
      attach_function :GetSystemTimeAdjustment, [:pointer, :pointer, :pointer], :bool

      #void WINAPI GetSystemTimeAsFileTime( _Out_  LPFILETIME lpSystemTimeAsFileTime )
      attach_function :GetSystemTimeAsFileTime, [:pointer], :void

      #DWORD WINAPI GetTickCount(void)
      attach_function :GetTickCount, [], :ulong

      #int GetTimeFormat(
      #  _In_       LCID Locale,
      #  _In_       DWORD dwFlags,
      #  _In_opt_   const SYSTEMTIME *lpTime,
      #  _In_opt_   LPCTSTR lpFormat,
      #  _Out_opt_  LPTSTR lpTimeStr,
      #  _In_       int cchTime )
      attach_function :GetTimeFormatA, [:ulong, :ulong, :pointer, :string, :pointer, :int], :int
      attach_function :GetTimeFormatW, [:ulong, :ulong, :pointer, :string, :pointer, :int], :int

      #DWORD WINAPI GetTimeZoneInformation( _Out_  LPTIME_ZONE_INFORMATION lpTimeZoneInformation )
      attach_function :GetTimeZoneInformation, [:pointer], :ulong

      #BOOL WINAPI LocalFileTimeToFileTime(
      #  _In_   const FILETIME *lpLocalFileTime,
      #  _Out_  LPFILETIME lpFileTime )
      attach_function :LocalFileTimeToFileTime, [:pointer, :pointer], :bool

      #BOOL WINAPI SetFileTime(
      #  _In_      HANDLE hFile,
      #  _In_opt_  const FILETIME *lpCreationTime,
      #  _In_opt_  const FILETIME *lpLastAccessTime,
      #  _In_opt_  const FILETIME *lpLastWriteTime )
      attach_function :SetFileTime, [:ulong, :pointer, :pointer, :pointer], :bool

      #BOOL WINAPI SetLocalTime( _In_  const SYSTEMTIME *lpSystemTime )
      attach_function :SetLocalTime, [:pointer], :bool

      #BOOL WINAPI SetSystemTime( _In_  const SYSTEMTIME *lpSystemTime )
      attach_function :SetSystemTime, [:pointer], :bool

      #BOOL WINAPI SetTimeZoneInformation( _In_  const TIME_ZONE_INFORMATION *lpTimeZoneInformation )
      attach_function :SetTimeZoneInformation, [:pointer], :bool

      #BOOL WINAPI SetSystemTimeAdjustment(
      #  _In_  DWORD dwTimeAdjustment,
      #  _In_  BOOL bTimeAdjustmentDisabled )
      attach_function :SetSystemTimeAdjustment, [:ulong, :bool], :bool

      #BOOL WINAPI SystemTimeToFileTime(
      #  _In_   const SYSTEMTIME *lpSystemTime,
      #  _Out_  LPFILETIME lpFileTime )
      attach_function :SystemTimeToFileTime, [:pointer, :pointer], :bool

      #BOOL WINAPI SystemTimeToTzSpecificLocalTime(
      #  _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZone,
      #  _In_      LPSYSTEMTIME lpUniversalTime,
      #  _Out_     LPSYSTEMTIME lpLocalTime )
      attach_function :SystemTimeToTzSpecificLocalTime, [:pointer, :pointer, :pointer], :bool

      begin
        #BOOL WINAPI GetSystemTimes(
        #  _Out_opt_  LPFILETIME lpIdleTime,
        #  _Out_opt_  LPFILETIME lpKernelTime,
        #  _Out_opt_  LPFILETIME lpUserTime )
        attach_function :GetSystemTimes, [:pointer, :pointer, :pointer], :bool

        #BOOL WINAPI TzSpecificLocalTimeToSystemTime(
        #  _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZoneInformation,
        #  _In_      LPSYSTEMTIME lpLocalTime,
        #  _Out_     LPSYSTEMTIME lpUniversalTime )
        attach_function :TzSpecificLocalTimeToSystemTime, [:pointer, :pointer, :pointer], :bool
      rescue FFI::NotFoundError
        # Windows XP or later
      end
    end
  end
end