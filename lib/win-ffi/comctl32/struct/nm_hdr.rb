module WinFFI
  module Comctl32
    class NMHDR < FFIStruct
      layout :hwndFrom, :hwnd,
             :idFrom,   :uint,
             :code,     :uint  # NM_ code
    end
  end
end