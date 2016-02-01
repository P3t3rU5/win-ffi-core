module WinFFI
  module User32
    MemberHsz = enum :member_hsz, [
        :CREATE,  1,
        :KEEP,    2,
        :DELETE,  3,
        :CLEANUP, 4,
    ]
  end
end