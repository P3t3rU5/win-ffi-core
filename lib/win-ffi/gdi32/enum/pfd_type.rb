require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PFD_TYPE = enum :pfd_type, [:RGBA, :COLORINDEX]
  end
end