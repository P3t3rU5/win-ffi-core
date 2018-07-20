module WinFFI
  # https://msdn.microsoft.com/en-us/56b5b350-f4b7-47af-b5f8-6a35f32c1009
  class SECURITY_ATTRIBUTES < FFIAdditions::Struct
    def nLength; end
    def nLength=(v) end
    def lpSecurityDescriptor; end
    def lpSecurityDescriptor=(v) end
    def bInheritHandle; end
    def bInheritHandle=(v) end

        layout nLength:                :dword,
           lpSecurityDescriptor: :pointer,
           bInheritHandle:          :bool

    def initialize
      super
      self[:nLength] = self.size
    end

    private :nLength, :nLength=
  end
end