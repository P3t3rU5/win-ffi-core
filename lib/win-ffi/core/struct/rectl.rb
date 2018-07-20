module WinFFI
  # https://msdn.microsoft.com/en-us/library/dd162907(v=vs.85).aspx
  class RECTL < FFIAdditions::Struct
    def left; end
    def left=(v) end
    def top; end
    def top=(v) end
    def right; end
    def right=(v) end
    def bottom; end
    def bottom=(v) end

    layout left:   :long,
           top:    :long,
           right:  :long,
           bottom: :long
  end
end