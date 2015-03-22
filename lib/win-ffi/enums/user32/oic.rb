module WinFFI
  module User32
    OIC = enum :oic,
    [
        :SAMPLE,          32512,
        :HAND,            32513,
        :QUES,            32514,
        :BANG,            32515,
        :NOTE,            32516,
        :WINLOGO,         32517,
        :WARNING,         32515,
        :ERROR,           32513,
        :INFORMATION,     32516
    ]

    #if(WINVER >= 0x0600)
    #define OIC_SHIELD          32518
    #endif /* WINVER >= 0x0600 */
    if WindowsVersion >= :vista
      OIC.instance_variable_get(:@kv_map)[:SHIELD] = 32518
      OIC.instance_variable_get(:@vk_map)[32518] = :SHIELD
    end
  end
end