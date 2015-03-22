module WinFFI
  module Kernel32
    #BOOL WINAPI GetDiskFreeSpace(
    #  _In_   LPCTSTR lpRootPathName,
    #  _Out_  LPDWORD lpSectorsPerCluster,
    #  _Out_  LPDWORD lpBytesPerSector,
    #  _Out_  LPDWORD lpNumberOfFreeClusters,
    #  _Out_  LPDWORD lpTotalNumberOfClusters )
    attach_function 'GetDiskFreeSpaceA', [:string, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function 'GetDiskFreeSpaceW', [:string, :pointer, :pointer, :pointer, :pointer], :bool

    #BOOL WINAPI GetDiskFreeSpaceEx(
    #  _In_opt_   LPCTSTR lpDirectoryName,
    #  _Out_opt_  PULARGE_INTEGER lpFreeBytesAvailable,
    #  _Out_opt_  PULARGE_INTEGER lpTotalNumberOfBytes,
    #  _Out_opt_  PULARGE_INTEGER lpTotalNumberOfFreeBytes )
    attach_function 'GetDiskFreeSpaceExA', [:string, :pointer, :pointer, :pointer], :bool
    attach_function 'GetDiskFreeSpaceExW', [:string, :pointer, :pointer, :pointer], :bool
  end
end