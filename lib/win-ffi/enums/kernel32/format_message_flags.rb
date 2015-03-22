module WinFFI
  FormatMessageFlags = enum :format_message_flags,
  [
    :ALLOCATE_BUFFER, 0x00000100,
    :IGNORE_INSERTS,  0x00000200,
    :FROM_STRING,     0x00000400,
    :FROM_HMODULE,    0x00000800,
    :FROM_SYSTEM,     0x00001000,
    :ARGUMENT_ARRAY,  0x00002000,
    :MAX_WIDTH_MASK,  0x000000FF
  ]
end