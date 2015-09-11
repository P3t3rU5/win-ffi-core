require 'win-ffi/enums/user32'

module WinFFI
  module User32
    Icon = enum :icon,
    [
        :SMALL, 0,
        :BIG,   1
    ]
    #if(_WIN32_WINNT >= 0x0501)
    #define ICON_SMALL2         2
    #endif /* _WIN32_WINNT >= 0x0501 */
    if WindowsVersion >= :xp
      Icon.instance_variable_get(:@kv_map)[:SMALL2] = 2
      Icon.instance_variable_get(:@vk_map)[2] = :SMALL2
    end
  end
end

