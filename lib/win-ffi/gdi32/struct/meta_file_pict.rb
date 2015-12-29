module WinFFI
  module Gdi32
    class METAFILEPICT < FFIStruct
      layout :mm,   :long,
             :xExt, :long,
             :yExt, :long,
             :hMf,  :long
    end
  end
end