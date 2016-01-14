module WinFFI
  module User32
    # Message filter info values (CHANGEFILTERSTRUCT.ExtStatus)
    MessageFilterInfo = enum :message_filter_info, [
        :NONE,                     0, # See the Remarks section. Applies to MSGFLT_ALLOW and MSGFLT_DISALLOW.
        :ALREADYALLOWED_FORWND,    1, # The message has already been allowed by this window_class's message filter, and the
        # function thus succeeded with no change to the window_class's message filter. Applies to MSGFLT_ALLOW.
        :ALREADYDISALLOWED_FORWND, 2, # The message has already been blocked by this window_class's message filter, and the
        # function thus succeeded with no change to the window_class's message filter. Applies to MSGFLT_DISALLOW.
        :ALLOWED_HIGHER,           3  # The message is allowed at a scope higher than the window_class. Applies to
        # MSGFLT_DISALLOW.
    ]
  end
end