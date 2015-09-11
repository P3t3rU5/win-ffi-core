require 'win-ffi/enums/user32'

module WinFFI
  module User32
    BroadcastSystemMessageFlags = enum :broadcast_system_message_flags,
    [
      :ALLCOMPONENTS, 0x00000000, #Broadcast to all system components.
      :APPLICATIONS,  0x00000008, # Broadcast to applications.
      :ALLDESKTOPS,   0x00000010, # Broadcast to all desktops. Requires the SE_TCB_NAME privilege.
    ]
  end
end