require_relative '../constant_base'
require_relative '../../core/struct/pointl'
require_relative '../../../../lib/win-ffi/gdi32/base'

#if (_WIN32_WINNT >= ((OSVER(NTDDI_WINXPSP2)) >> 16))

module WinFFI
  module Gdi32
    class DEVMODE_UNION_STRUCT_1 < FFIAdditions::Struct
      def dmOrientation; end
      def dmOrientation=(v) end
      def dmPaperSize; end
      def dmPaperSize=(v) end
      def dmPaperLength; end
      def dmPaperLength=(v) end
      def dmPaperWidth; end
      def dmPaperWidth=(v) end
      def dmScale; end
      def dmScale=(v) end
      def dmCopies; end
      def dmCopies=(v) end
      def dmDefaultSource; end
      def dmDefaultSource=(v) end
      def dmPrintQuality; end
      def dmPrintQuality=(v) end

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
      def dmPosition; end
      def dmPosition=(v) end
      def dmDisplayOrientation; end
      def dmDisplayOrientation=(v) end
      def dmDisplayFixedOutput; end
      def dmDisplayFixedOutput=(v) end

      layout dmPosition:           POINTL,
             dmDisplayOrientation: :dword,
             dmDisplayFixedOutput: :dword
    end

    class DEVMODE_UNION_1 < FFIAdditions::Union
      def s1; end
      def s1=(v) end
      def s2; end
      def s2=(v) end

      layout s1: DEVMODE_UNION_STRUCT_1,
             s2: DEVMODE_UNION_STRUCT_2
    end

    class DEVMODE_UNION_2 < FFIAdditions::Union
      def dmDisplayFlags; end
      def dmDisplayFlags=(v) end
      def dmNup; end
      def dmNup=(v) end

      layout dmDisplayFlags: :dword,
             dmNup:          :dword
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd183565(v=vs.85).aspx
    class DEVMODE < FFIAdditions::Struct
      def dmDeviceName; end
      def dmDeviceName=(v) end
      def dmSpecVersion; end
      def dmSpecVersion=(v) end
      def dmDriverVersion; end
      def dmDriverVersion=(v) end
      def dmSize; end
      def dmSize=(v) end
      def dmDriverExtra; end
      def dmDriverExtra=(v) end
      def dmFields; end
      def dmFields=(v) end
      def union_1; end
      def union_1=(v) end
      def dmColor; end
      def dmColor=(v) end
      def dmDuplex; end
      def dmDuplex=(v) end
      def dmYResolution; end
      def dmYResolution=(v) end
      def dmTTOption; end
      def dmTTOption=(v) end
      def dmCollate; end
      def dmCollate=(v) end
      def dmFormName; end
      def dmFormName=(v) end
      def dmLogPixels; end
      def dmLogPixels=(v) end
      def dmBitsPerPel; end
      def dmBitsPerPel=(v) end
      def dmPelsWidth; end
      def dmPelsWidth=(v) end
      def dmPelsHeight; end
      def dmPelsHeight=(v) end
      def union_2; end
      def union_2=(v) end
      def dmDisplayFrequency; end
      def dmDisplayFrequency=(v) end
      def dmICMMethod; end
      def dmICMMethod=(v) end
      def dmICMIntent; end
      def dmICMIntent=(v) end
      def dmMediaType; end
      def dmMediaType=(v) end
      def dmDitherType; end
      def dmDitherType=(v) end
      def dmReserved1; end
      def dmReserved1=(v) end
      def dmReserved2; end
      def dmReserved2=(v) end
      def dmPanningWidth; end
      def dmPanningWidth=(v) end
      def dmPanningHeight; end
      def dmPanningHeight=(v) end

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