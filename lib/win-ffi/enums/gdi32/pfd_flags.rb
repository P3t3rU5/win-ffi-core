require 'win-ffi/enums/gdi32'

module WinFFI
  module Gdi32
    PFDFlags = enum :pfd_flags,
    [
      :DOUBLEBUFFER,          0x0001,
      :STEREO,                0x0002,
      :DRAW_TO_WINDOW,        0x0004,
      :DRAW_TO_BITMAP,        0x0008,
      :SUPPORT_GDI,           0x0010,
      :SUPPORT_OPENGL,        0x0020,
      :GENERIC_FORMAT,        0x0040,
      :NEED_PALETTE,          0x0080,
      :NEED_SYSTEM_PALETTE,   0x0100,
      :SWAP_EXCHANGE,         0x0200,
      :SWAP_COPY,             0x0400,
      :SWAP_LAYER_BUFFERS,    0x0800,
      :GENERIC_ACCELERATED,   0x1000,
      :SUPPORT_DIRECTDRAW,    0x2000,
      :DIRECT3D_ACCELERATED,  0x4000,
      :SUPPORT_COMPOSITION,   0x8000,
      :DEPTH_DONTCARE,        0x20000000,
      :DOUBLEBUFFER_DONTCARE, 0x40000000,
      :STEREO_DONTCARE,       0x80000000
    ]
  end
end