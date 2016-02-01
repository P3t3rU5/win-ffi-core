require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
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

    if WindowsVersion >= :vista
      buffer += [
          :SHIELD, 32518
      ]
    end

    OemIcon = enum :oem_icon, buffer
  end
end