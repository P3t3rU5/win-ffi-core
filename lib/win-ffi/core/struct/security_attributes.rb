module WinFFI
  class SECURITY_ATTRIBUTES < FFIAdditions::Struct
    layout nLength:                :dword,
           lpSecurityDescriptor: :pointer,
           bInheritHandle:          :bool

    def initialize
      super
      self[:nLength] = self.size
    end
  end
end