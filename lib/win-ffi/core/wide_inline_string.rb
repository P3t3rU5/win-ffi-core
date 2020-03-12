require 'win-ffi/core'
require 'win-ffi/core/string_utils'

using WinFFI::StringUtils

module WinFFI
  class WideInlineString
    include FFI::DataConverter

    attr_reader :size, :native_type

    def initialize(size)
      @size = size
      @native_type = FFI::ArrayType.new(WinFFI.find_type(:wchar), size)
    end


    def to_native(value, _context)
      value.to_byte_array
    end

    def from_native(value, _context)
      String.from_byte_array(value.to_a)
    end

    alias_method :length, :size
  end
end
