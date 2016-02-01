module WinFFI
  module User32
    # DDE constants for wStatus field
    DdeStatus = enum :dde_status, [
        :ACK,          0x8000,
        :BUSY,         0x4000,
        :DEFERUPD,     0x4000,
        :ACKREQ,       0x8000,
        :RELEASE,      0x2000,
        :REQUESTED,    0x1000,
        :APPSTATUS,    0x00ff,
        :NOTPROCESSED, 0x0000,
        :ACKRESERVED, ~(0x8000 | 0x4000 | 0x00ff),
        :ADVRESERVED, ~(0x8000 | 0x4000),
        :DATRESERVED, ~(0x8000 | 0x2000 | 0x1000),
        :POKRESERVED, ~(0x2000),
    ]
  end
end