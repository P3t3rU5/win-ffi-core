module WinFFI
  class SIZE < FFI::Struct
    layout :cx, :long,
           :cy, :long
  end
end