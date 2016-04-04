module WinFFI
  module User32
    HookCode = enum :hook_code, [
        :ACTION,      0,
        :GETNEXT,     1,
        :SKIP,        2,
        :NOREM,       3,
        :NOREMOVE,    3,
        :SYSMODALON,  4,
        :SYSMODALOFF, 5
    ]
  end
end