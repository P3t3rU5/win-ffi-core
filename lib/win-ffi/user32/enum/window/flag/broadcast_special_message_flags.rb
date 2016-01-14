require 'win-ffi/user32'

module WinFFI
  module User32
    # Broadcast Special Message Recipient list
    BroadcastSpecialMessageFlags = enum :broadcast_special_message_flags, [
        :ALLCOMPONENTS,      0x00000000, # Broadcast to all system components.
        :VXDS,               0x00000001,
        :NETDRIVER,          0x00000002,
        :INSTALLABLEDRIVERS, 0x00000004,
        :APPLICATIONS,       0x00000008, # Broadcast to applications.
        :ALLDESKTOPS,        0x00000010, # Broadcast to all desktops. Requires the SE_TCB_NAME privilege.
    ]
  end
end