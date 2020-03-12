require_relative '../constant_base'
require_relative '../../core/struct/pointl'
require_relative '../../../../lib/win-ffi/gdi32/base'

#if (_WIN32_WINNT >= ((OSVER(NTDDI_WINXPSP2)) >> 16))

module WinFFI
  module Gdi32
    class DEVMODE_UNION_STRUCT_1 < FFIAdditions::Struct
      attr_accessor :dmOrientation,
                    :dmPaperSize,
                    :dmPaperLength,
                    :dmPaperWidth,
                    :dmScale,
                    :dmCopies,
                    :dmDefaultSource,
                    :dmPrintQuality

      layout dmOrientation:   :short,
             dmPaperSize:     :short,
             dmPaperLength:   :short,
             dmPaperWidth:    :short,
             dmScale:         :short,
             dmCopies:        :short,
             dmDefaultSource: :short,
             dmPrintQuality:  :short
    end

    class DEVMODE_UNION_STRUCT_2 < FFIAdditions::Struct
      attr_accessor :dmPosition, :dmDisplayOrientation, :dmDisplayFixedOutput
      layout dmPosition:           POINTL,
             dmDisplayOrientation: :dword,
             dmDisplayFixedOutput: :dword
    end

    class DEVMODE_UNION_1 < FFIAdditions::Union
      attr_accessor :s1, :s2
      layout s1: DEVMODE_UNION_STRUCT_1,
             s2: DEVMODE_UNION_STRUCT_2
    end

    class DEVMODE_UNION_2 < FFIAdditions::Union
      attr_accessor :dmDisplayFlags, :dmNup
      layout dmDisplayFlags: :dword,
             dmNup:          :dword
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd183565(v=vs.85).aspx
    class DEVMODE < FFIAdditions::Struct
      attr_accessor :dmDeviceName,
                    :dmSpecVersion,
                    :dmDriverVersion,
                    :dmSize,
                    :dmDriverExtra,
                    :dmFields,
                    :union_1,
                    :dmColor,
                    :dmDuplex,
                    :dmYResolution,
                    :dmTTOption,
                    :dmCollate,
                    :dmFormName,
                    :dmLogPixels,
                    :dmBitsPerPel,
                    :dmPelsWidth,
                    :dmPelsHeight,
                    :union_2,
                    :dmDisplayFrequency,
                    :dmICMMethod,
                    :dmICMIntent,
                    :dmMediaType,
                    :dmDitherType,
                    :dmReserved1,
                    :dmReserved2,
                    :dmPanningWidth,
                    :dmPanningHeight

      layout dmDeviceName:       [:char, CCHDEVICENAME],
             dmSpecVersion:      :word,
             dmDriverVersion:    :word,
             dmSize:             :word,
             dmDriverExtra:      :word,
             dmFields:           :dword,
             union_1:            DEVMODE_UNION_1,
             dmColor:            :short,
             dmDuplex:           :short,
             dmYResolution:      :short,
             dmTTOption:         :short,
             dmCollate:          :short,
             dmFormName:         [:char, CCHFORMNAME],
             dmLogPixels:        :word,
             dmBitsPerPel:       :dword,
             dmPelsWidth:        :dword,
             dmPelsHeight:       :dword,
             union_2:            DEVMODE_UNION_2,
             dmDisplayFrequency: :dword,
             dmICMMethod:        :dword,
             dmICMIntent:        :dword,
             dmMediaType:        :dword,
             dmDitherType:       :dword,
             dmReserved1:        :dword,
             dmReserved2:        :dword,
             dmPanningWidth:     :dword,
             dmPanningHeight:    :dword
    end
  end
end