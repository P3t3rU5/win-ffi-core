require 'win-ffi/enums/user32'

module WinFFI
  module User32

    MWMO = enum :mwmo, [
        :ALERTABLE, 0x0002, # The function also returns if an APC has been queued to the thread with QueueUserAPC while
        # the thread is in the waiting state.

        :INPUTAVAILABLE, 0x0004, # The function returns if input exists for the queue, even if the input has been seen
        # (but not removed) using a call to another function, such as PeekMessage.

        :WAITALL, 0x0001, # The function returns when all objects in the pHandles array are signaled and an input event
                          # has been received, all at the same time.
    ]
  end
end