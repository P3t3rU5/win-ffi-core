module WinFFI
  class WideInlineString
    include FFI::DataConverter

    attr_reader :size, :native_type

    def initialize(size)
      @size = size
      @native_type = FFI::ArrayType.new(LibBase.find_type(:tchar), size)
    end

    def to_native(_value, _context)
      raise NotImplementedError
    end

    def from_native(value, _context)
      LibBase.string_from_byte_array(value.to_a)
    end

    alias_method :length, :size
  end
end
