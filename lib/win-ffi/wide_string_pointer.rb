module WinFFI
  class WideStringPointer
    extend FFI::DataConverter
    native_type FFI::Type::POINTER
    # TODO
    class << self

      def to_native(value, _context)

      end

      def from_native(pointer, _context)

      end

    end

  end
end
