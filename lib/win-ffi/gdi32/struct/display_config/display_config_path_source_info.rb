require 'win-ffi/general/struct/luid'

module WinFFI
  module Gdi32


    class DPSISTRUCTNAME < FFIStruct
      layout :cloneGroupId,      :uint32,
             :sourceModeInfoIdx, :uint32
    end

    class DPSIUNIONNAME < FFI::Union
      layout :modeInfoIdx, :uint32,
             :s,           DPSISTRUCTNAME
    end

    class DISPLAYCONFIG_PATH_SOURCE_INFO < FFIStruct
      layout :adapterId,   LUID,
             :id,          :uint32,
             :u,           DPSIUNIONNAME,
             :statusFlags, :uint32
    end
  end
end