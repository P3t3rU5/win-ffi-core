module WinFFI
  module User32
    buffer = [
        :FLAGS, 1, # The handle flags. The pvInfo parameter must point to a USEROBJECTFLAGS structure.
        :NAME, 2, # The name of the object, as a string.
        :TYPE, 3, # The type name of the object, as a string.
        :USER_SID, 4, # The SID structure that identifies the user that is currently associated with the specified
        # object. If no user is associated with the object, the value returned in the buffer pointed to by
        # lpnLengthNeeded is zero. Note that SID is a variable length structure. You will usually make a call to
        # GetUserObjectInformation to determine the length of the SID before retrieving its value.
    ]

    if WindowsVersion >= :vista
      buffer += [
          :HEAPSIZE, 5, # The size of the desktop heap, in KB, as a ULONG value. The hObj parameter must be a handle to a
          # desktop object, otherwise, the function fails.
          # Windows Server 2003 and Windows XP/2000:  This value is not supported.
          :IO, 6, # TRUE if the hObj parameter is a handle to the desktop object that is receiving input from the user.
      # FALSE otherwise. Windows Server 2003 and Windows XP/2000:  This value is not supported.
      ]
    end

    UserObjectInformationFlags = enum :user_object_information_flags, buffer
  end
end