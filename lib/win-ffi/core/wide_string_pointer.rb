module WinFFI
  class WideStringPointer
    extend FFI::DataConverter
    native_type FFI::Type::POINTER
    # TODO
      def initialize(size)
        @size = size
      end

      def to_native(value, _context)
        value.address
      end

      def from_native(pointer, _context)
        pointer.read_bytes(@size)
      end

  end
end
