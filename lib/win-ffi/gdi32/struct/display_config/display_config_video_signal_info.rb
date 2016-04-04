require 'win-ffi/gdi32/struct/display_config/display_config_rational'
require 'win-ffi/gdi32/struct/display_config/display_config_2d_region'
require 'win-ffi/gdi32/enum/display_config/display_config_scanline_ordering'

module WinFFI
  module Gdi32

    class AdditionalSignalInfo < FFIStruct
      layout :flags, :uint32

      def videoStandard
        # TODO
      end

      def vSyncFreqDivider
        # TODO
      end

      def videoStandard=(v)
        # TODO
      end

      def vSyncFreqDivider=(v)
        # TODO
      end
    end

    class DVSIUNION < FFI::Union
      layout :AdditionalSignalInfo, AdditionalSignalInfo,
             :videoStandard,        :uint32
    end


    class DISPLAYCONFIG_VIDEO_SIGNAL_INFO < FFIStruct
      layout :pixelRate,        :uint64,
             :hSyncFreq,        DISPLAYCONFIG_RATIONAL,
             :vSyncFreq,        DISPLAYCONFIG_RATIONAL,
             :activeSize,       DISPLAYCONFIG_2DREGION,
             :totalSize,        DISPLAYCONFIG_2DREGION,
             :u,                DVSIUNION,
             :scanLineOrdering, DisplayconfigScanlineOrdering
    end
  end
end