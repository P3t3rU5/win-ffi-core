module WinFFI
  module Gdi32
    module OpenGL
      extend LibBase

      ffi_lib 'gdi32'

      PFDFlags = enum :pfd_flags, [
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

      PFD_TYPE = enum :pfd_type, [:RGBA, :COLORINDEX]

      PFD_LAYER_TYPE = enum :pfd_layer_type, [:MAIN_PLANE, :OVERLAY_PLANE, :UNDERLAY_PLANE, -1]

      class PIXELFORMATDESCRIPTOR < FFI::Struct
        FLAGS_INV = PFDFlags.to_hash.reduce(Hash.new{|h,k| h[k] = []}){|h,(k,v)| h[v] << k; h}.freeze

        layout :nSize,           :ushort,
               :nVersion,        :ushort,
               :dwFlags,         :uint,
               :iPixelType,      :char,
               :cColorBits,      :char,
               :cRedBits,        :char,
               :cRedShift,       :char,
               :cGreenBits,      :char,
               :cGreenShift,     :char,
               :cBlueBits,       :char,
               :cBlueShift,      :char,
               :cAlphaBits,      :char,
               :cAlphaShift,     :char,
               :cAccumBits,      :char,
               :cAccumRedBits,   :char,
               :cAccumGreenBits, :char,
               :cAccumBlueBits,  :char,
               :cAccumAlphaBits, :char,
               :cDepthBits,      :char,
               :cStencilBits,    :char,
               :cAuxBuffers,     :char,
               :iLayerType,      :char,
               :bReserved,       :char,
               :dwLayerMask,     :uint,
               :dwVisibleMask,   :uint,
               :dwDamageMask,    :uint

        #TODO
        #undef_method :nSize=

        def initialize
          super
          self[:nSize] = self.size
        end

        def dwFlags
          val = self[:dwFlags]
          Set.new(FLAGS_INV.select{|k,_| val & k != 0}.reduce([]) {|a,(_,v)| a << v}.flatten)
        end

        def dwFlags=(flags)
          self[:dwFlags] = [*flags].reduce(0) {|a,f| a | PFDFlags[f].to_i}
        end

        def to_s
          [:iPixelType, :cColorBits, :cAccumBits, :cDepthBits, :iLayerType, :dwFlags].map{|n| "#{n} = #{send(n).inspect}"}.join(', ')
        end
      end

      #int ChoosePixelFormat(
      #  HDC hdc,
      #  const PIXELFORMATDESCRIPTOR *ppfd)
      attach_function 'ChoosePixelFormat', [:pointer, PIXELFORMATDESCRIPTOR.ptr], :int

      #int DescribePixelFormat(
      #  HDC hdc,
      #  int iPixelFormat,
      #  UINT nBytes,
      #  LPPIXELFORMATDESCRIPTOR ppfd)
      attach_function 'DescribePixelFormat', [:pointer, :int, :uint, :pointer], :int

      #BOOL SetPixelFormat(
      #  HDC hdc,
      #  int iPixelFormat,
      #  const PIXELFORMATDESCRIPTOR *ppfd)
      attach_function 'SetPixelFormat', [:pointer, :int, :pointer], :bool

      #BOOL SwapBuffers(  HDC hdc)
      attach_function 'SwapBuffers', [:pointer], :bool
    end
  end
end