module WinFFI
  module Gdi32
    class BLENDFUNCTION < FFIStruct
      layout :BlendOp,             :byte,
             :BlendFlags,          :byte,
             :SourceConstantAlpha, :byte,
             :AlphaFormat,         :byte
    end
  end
end