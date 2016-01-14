require 'win-ffi/user32'

module WinFFI
  module User32
    # Queue status flags for GetQueueStatus() and MsgWaitForMultipleObjects()
    buffer = [
        :KEY,            0x0001, # A WM_KEYUP, WM_KEYDOWN, WM_SYSKEYUP, or WM_SYSKEYDOWN message is in the queue.
        :MOUSEMOVE,      0x0002, # A WM_MOUSEMOVE message is in the queue.
        :MOUSEBUTTON,    0x0004, # A mouse-button message (WM_LBUTTONUP, WM_RBUTTONDOWN, and so on).
        :POSTMESSAGE,    0x0008, # A posted message (other than those listed here) is in the queue.
        :TIMER,          0x0010, # A WM_TIMER message is in the queue.
        :PAINT,          0x0020, # A WM_PAINT message is in the queue.
        :SENDMESSAGE,    0x0040, # A message sent by another thread or application is in the queue.
        :HOTKEY,         0x0080, # A WM_HOTKEY message is in the queue.
        :ALLPOSTMESSAGE, 0x0100, # A posted message (other than those listed here) is in the queue.

        :MOUSE, 0x0006, #:MOUSEMOVE | :MOUSEBUTTON, A WM_MOUSEMOVE message or mouse-button message (WM_LBUTTONUP,
        # WM_RBUTTONDOWN, and so on).
        :INPUT, 0x0407, #:MOUSE | :KEY | :RAWINPUT, # An input message is in the queue.
        :ALLEVENTS, 0x04B7, # (:INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY), # An input, WM_TIMER, WM_PAINT,
        # WM_HOTKEY, or posted message is in the queue.
        :ALLINPUT, 0x04FF, # (:INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY | :SENDMESSAGE), # Any message is in the
         # queue.
    ]

    if WindowsVersion >= :xp
      buffer += [
          :RAWINPUT, 0x0400, #A raw input message is in the queue. For more information, see Raw Input.
      ]
      if WindowsVersion >= 8
        buffer += [
            :TOUCH,   0x0800,
            :POINTER, 0x1000,
            :INPUT, 0x1C07, # :MOUSE | :KEY | :RAWINPUT | :TOUCH | :POINTER , An input message is in the queue.
            :ALLEVENTS, 0x1CBF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY, An input, WM_TIMER, WM_PAINT,
            # WM_HOTKEY, or posted message is in the queue.
            :ALLINPUT, 0x1CFF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY | :SENDMESSAGE, Any message is in the
            # queue.
        ]
      else
        buffer += [
            :INPUT, 0x0407, # :MOUSE | :KEY | :RAWINPUT, An input message is in the queue.
            :ALLEVENTS, 0x04BF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY, An input, WM_TIMER, WM_PAINT,
            # WM_HOTKEY, or posted message is in the queue.
            :ALLINPUT, 0x04FF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY | :SENDMESSAGE, Any message is in the
            # queue.
        ]
      end
    else
      buffer += [
          :INPUT, 0x0007, # :MOUSE | :KEY, An input message is in the queue.
          :ALLEVENTS, 0x00BF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY, An input, WM_TIMER, WM_PAINT,
          # WM_HOTKEY, or posted message is in the queue.
          :ALLINPUT, 0x00FF, # :INPUT | :POSTMESSAGE | :TIMER | :PAINT | :HOTKEY | :SENDMESSAGE, Any message is in the
          # queue.
      ]
    end

    QueueStatusFlags = enum :queue_status_flags, buffer
  end
end