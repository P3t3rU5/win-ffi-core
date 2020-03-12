module WinFFI
  # https://msdn.microsoft.com/en-us/56b5b350-f4b7-47af-b5f8-6a35f32c1009
  class SECURITY_ATTRIBUTES < FFIAdditions::Struct
    attr_accessor :nLength, :lpSecurityDescriptor, :bInheritHandle

    layout nLength:              :dword,
           lpSecurityDescriptor: :pointer,
           bInheritHandle:       :bool

    def initialize
      super
      self[:nLength] = self.size
    end

    private :nLength, :nLength=
  end
end