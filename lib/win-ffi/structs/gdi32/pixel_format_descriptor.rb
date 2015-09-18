require_relative '../../enums/gdi32/pfd_flags'

module WinFFI
  module Gdi32
    class PIXELFORMATDESCRIPTOR < FFIStruct
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
        self.nSize = self.size
      end

      def dwFlags
        val = self.dwFlags
        Set.new(FLAGS_INV.select{|k,_| val & k != 0}.reduce([]) {|a,(_,v)| a << v}.flatten)
      end

      def dwFlags=(flags)
        self.dwFlags = [*flags].reduce(0) {|a,f| a | PFDFlags[f].to_i}
      end

      def to_s
        [:iPixelType, :cColorBits, :cAccumBits, :cDepthBits, :iLayerType, :dwFlags].map{|n| "#{n} = #{send(n).inspect}"}.join(', ')
      end
    end
  end
end