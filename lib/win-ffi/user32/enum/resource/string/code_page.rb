module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317756(v=vs.85).aspx
    CodePage = enum :code_page, [
        :ACP,   0, # Use system default ANSI code page.
        :MACCP, 2, # Use the system default Macintosh code page.
        :OEMCP, 1  # Use system default OEM code page.
    ]
  end
end