require 'win-ffi/enums/user32'

module WinFFI
  module User32
    ClipboardFormats = enum :clipboard_formats,
    [
      :TEXT,            1,
      :BITMAP,          2,
      :METAFILEPICT,    3,
      :SYLK,            4,
      :DIF,             5,
      :TIFF,            6,
      :OEMTEXT,         7,
      :DIB,             8,
      :PALETTE,         9,
      :PENDATA,         10,
      :RIFF,            11,
      :WAVE,            12,
      :UNICODETEXT,     13,
      :ENHMETAFILE,     14,
      :HDROP,           15,
      :LOCALE,          16,
      :MAX,             18, # Assume Windows 2000 or later
      :OWNERDISPLAY,    0x0080,
      :DSPTEXT,         0x0081,
      :DSPBITMAP,       0x0082,
      :DSPMETAFILEPICT, 0x0083,
      :DSPENHMETAFILE,  0x008E
    ]
  end
end