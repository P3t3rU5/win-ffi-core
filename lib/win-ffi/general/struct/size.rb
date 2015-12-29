module WinFFI
  class SIZE < FFIStruct
    layout :cx, :long,
           :cy, :long
  end
end