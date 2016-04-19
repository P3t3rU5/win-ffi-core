require 'ffi'
require 'win-ffi/core/lib_base'

module WinFFI
  extend LibBase
  class FFIStruct < FFI::Struct
    def self.layout(*args)
      super
      members.each do |name|
        unless method_defined?(name)
          define_method name, ->{ self[name] }
          define_method "#{name}=", ->(v){ self[name] = v }
        end
      end
    end
  end
end
