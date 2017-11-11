require 'ffi-additions/struct'
require 'win-ffi/core/string_utils'

using WinFFI::StringUtils

module FFIAdditions
  class Struct
    def self.encoded_setter(name)
      define_method("#{name}=", ->(string) do
        if WinFFI.encoding == 'A'
          (to_ptr + offset_of(name)).write_string(string)
        else
          (to_ptr + offset_of(name)).write_array_of_uint16(string.to_w.unpack('S*'))
        end
      end)
    end
  end
end