module WinFFI
  module User32
    WH_MSGFILTER_Code = enum :wh_msgfilter_code, [
        :DIALOGBOX,     0,
        :MESSAGEBOX,    1,
        :MENU,          2,
        :SCROLLBAR,     5,
        :NEXTWINDOW,    6,
        :MAX,           8, # unused
        :USER,       4096
    ]
  end
end