module WinFFI
  module User32
    StaticNotification = enum :static_notification,
    [
        :CLICKED, 0,
        :DBLCLK,  1,
        :ENABLE,  2,
        :DISABLE, 3
    ]
  end
end