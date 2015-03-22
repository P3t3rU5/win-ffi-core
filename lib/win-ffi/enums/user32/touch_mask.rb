module WinFFI
  module User32
    TouchMask = enum :touch_mask,
    [
      :TOUCH_MASK_NONE,        0x00000000, #Default. None of the optional fields are valid.
      :TOUCH_MASK_CONTACTAREA, 0x00000001, #rcContact of the POINTER_TOUCH_INFO structure is valid.
      :TOUCH_MASK_ORIENTATION, 0x00000002, #orientation of the POINTER_TOUCH_INFO structure is valid.
      :TOUCH_MASK_PRESSURE,    0x00000004, #pressure of the POINTER_TOUCH_INFO structure is valid.
    ]
  end
end