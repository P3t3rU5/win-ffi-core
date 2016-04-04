require 'win-ffi/general/struct/luid'

require 'win-ffi/gdi32/enum/display_config/display_config_video_output_technology'
require 'win-ffi/gdi32/enum/display_config/display_config_rotation'
require 'win-ffi/gdi32/enum/display_config/display_config_scaling'

require 'win-ffi/gdi32/struct/display_config/display_config_rational'

module WinFFI
  module Gdi32

    class DPTISTRUCTNAME < FFIStruct
      layout :desktopModeInfoIdx, :uint32,
             :targetModeInfoIdx,  :uint32
    end

    class DPTIUNIONNAME < FFI::Union
      layout :modeInfoIdx, :uint32,
             :s,           DPTISTRUCTNAME
    end

    class DISPLAYCONFIG_PATH_TARGET_INFO < FFIStruct
      layout :adapterId,        LUID,
             :id,               :uint32,
             :u,                DPTIUNIONNAME,
             :outputTechnology, DisplayconfigVideoOutputTechnology,
             :rotation,         DisplayConfigRotation,
             :scaling,          DisplayConfigScaling,
             :refreshRate,      DISPLAYCONFIG_RATIONAL,
             :scanLineOrdering, DisplayconfigScanlineOrdering,
             :targetAvailable,  :bool,
             :statusFlags,      :uint32
    end
  end
end