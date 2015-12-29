require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    #BOOL WINAPI GetDiskFreeSpace(
    #  _In_   LPCTSTR lpRootPathName,
    #  _Out_  LPDWORD lpSectorsPerCluster,
    #  _Out_  LPDWORD lpBytesPerSector,
    #  _Out_  LPDWORD lpNumberOfFreeClusters,
    #  _Out_  LPDWORD lpTotalNumberOfClusters )
    encoded_function 'GetDiskFreeSpace', [:string, :pointer, :pointer, :pointer, :pointer], :bool

    #BOOL WINAPI GetDiskFreeSpaceEx(
    #  _In_opt_   LPCTSTR lpDirectoryName,
    #  _Out_opt_  PULARGE_INTEGER lpFreeBytesAvailable,
    #  _Out_opt_  PULARGE_INTEGER lpTotalNumberOfBytes,
    #  _Out_opt_  PULARGE_INTEGER lpTotalNumberOfFreeBytes )
    encoded_function 'GetDiskFreeSpaceEx', [:string, :pointer, :pointer, :pointer], :bool
  end
end