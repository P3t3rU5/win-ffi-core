module WinFFI
  module User32
    # WM_POINTERACTIVATE return codes
    PointerActivateReturn = enum :pointer_activate_return, [
        :ACTIVATE,   1,
        :NOACTIVATE, 3
    ]
  end
end