module WinFFI
  module StringUtils
    refine ::String.singleton_class do
      if WinFFI.ascii?
        def from_byte_array(array)
          array[0, array.index(0) || array.length].pack('C*').encode(Encoding::UTF_8)
        end

        def from_pointer(pointer, _)
          pointer.read_string
        end
      else
        def from_byte_array(array)
          array = array[0, array.index(0) || array.length]
          array.pack('S*').force_encoding(Encoding::UTF_16LE).encode(Encoding::UTF_8)
        end

        def from_pointer(pointer, size)
          from_byte_array pointer.read_array_of_uint16(size)
        end
      end
    end

    refine ::String do
      if WinFFI.wide?
        def to_byte_array
          FFI::MemoryPointer.new(WinFFI.find_type(:tchar), @size).write_string(string)
        end
      else
        def to_byte_array
          FFI::MemoryPointer.new(WinFFI.find_type(:tchar), @size).write_array_of_uint16(string.unpack('S*'))
        end
      end

      def to_utf8
        encode('utf-8')
      end

      def to_w
        encode('utf-16LE')
      end
    end

    refine ::Object do
      def to_utf8
        to_s.to_utf8
      end

      def to_w
        to_s.to_w
      end
    end
  end
end