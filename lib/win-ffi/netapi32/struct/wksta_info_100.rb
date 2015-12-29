module WinFFI
  class WKSTA_INFO_100 < FFIStruct
    layout :wki100_platform_id,  :dword,
           :wki100_computername, :string,
           :wki100_langroup,     :string,
           :wki100_ver_major,    :dword,
           :wki100_ver_minor,    :dword
  end
end