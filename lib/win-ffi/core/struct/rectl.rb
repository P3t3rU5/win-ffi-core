module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rectl
  class RECTL < FFIAdditions::Struct
    attr_accessor :left, :top, :right, :bottom

    layout left:   :long,
           top:    :long,
           right:  :long,
           bottom: :long
  end
end