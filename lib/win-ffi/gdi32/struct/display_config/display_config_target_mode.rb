require 'win-ffi/gdi32/struct/display_config/display_config_video_signal_info'

module WinFFI
  module Gdi32
    class DISPLAYCONFIG_TARGET_MODE < FFIStruct
      layout :targetVideoSignalInfo, DISPLAYCONFIG_VIDEO_SIGNAL_INFO
    end
  end
end