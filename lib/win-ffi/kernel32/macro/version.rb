require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/version/version_flags'
require 'win-ffi/kernel32/enum/version/win32_winnt'

require 'win-ffi/kernel32/function/system_info'

module WinFFI
  module Kernel32
    include WinFFI
    if Architecture == 'x64-mingw32'
      class << self
        def IsWindowsVersionOrGreater(wMajorVersion, wMinorVersion, wServicePackMajor)
          osvi = OSVERSIONINFOEX.new

          # WinFFI.logger.debug VersionFlags[:MAJORVERSION]
          # WinFFI.logger.debug VersionFlags[:GREATER_EQUAL]
          # WinFFI.logger.debug "=================="
          # WinFFI.logger.debug VerSetConditionMask(0, VersionFlags[:MAJORVERSION], VersionFlags[:GREATER_EQUAL])
          # WinFFI.logger.debug "=================="
          # WinFFI.logger VerSetConditionMask(0, :MAJORVERSION, :GREATER_EQUAL)

          dwlConditionMask = VerSetConditionMask(
              VerSetConditionMask(
                  VerSetConditionMask(0, :MAJORVERSION, :GREATER_EQUAL),
                  :MINORVERSION, :GREATER_EQUAL),
              :SERVICEPACKMAJOR, :GREATER_EQUAL)

          osvi.dwMajorVersion = WIN32_WINNT[wMajorVersion]
          osvi.dwMinorVersion = WIN32_WINNT[wMinorVersion]
          osvi.wServicePackMajor = wServicePackMajor

          !VerifyVersionInfo(osvi, VersionFlags[:MAJORVERSION] |
              VersionFlags[:MINORVERSION] |
              VersionFlags[:SERVICEPACKMAJOR], dwlConditionMask)
        end

        def IsWindowsXPOrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 0)
        end

        def IsWindowsXPSP1OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 1)
        end

        def IsWindowsXPSP2OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 2)
        end

        def IsWindowsXPSP3OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 3)
        end

        def IsWindowsVistaOrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 0)
        end

        def IsWindowsVistaSP1OrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 1)
        end

        def IsWindowsVistaSP2OrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 2)
        end

        def IsWindows7OrGreater
          IsWindowsVersionOrGreater(:WIN7, :WIN7, 0)
        end

        def IsWindows7SP1OrGreater
          IsWindowsVersionOrGreater(:WIN7, :WIN7, 1)
        end

        def IsWindows8OrGreater
          IsWindowsVersionOrGreater(:WIN8, :WIN8, 0)
        end


        def IsWindows8Point1OrGreater
          IsWindowsVersionOrGreater(:WINBLUE, :WINBLUE, 0)
        end

        def IsWindowsThresholdOrGreater
          IsWindowsVersionOrGreater(:WINTHRESHOLD, :WINTHRESHOLD, 0)
        end

        def IsWindows10OrGreater
          IsWindowsVersionOrGreater(:WINTHRESHOLD, :WINTHRESHOLD, 0)
        end


        def IsWindowsServer
          !VerifyVersionInfo(
              OSVERSIONINFOEX.new,
              VersionFlags[:PRODUCT_TYPE],
              VerSetConditionMask(0, VersionFlags[:PRODUCT_TYPE], VersionFlags[:EQUAL]))
        end
      end
    end
  end
end